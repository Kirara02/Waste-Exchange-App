import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';

class EWalletTransferPage extends ConsumerWidget {
  final EWallet eWallet;
  const EWalletTransferPage({super.key, required this.eWallet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    // Daftar rekomendasi jumlah transfer
    final List<double> recommendedAmounts = [10000, 25000, 50000, 100000];

    return Scaffold(
      appBar: CustomAppBar(title: eWallet.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Nomor Telepon
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  hintText: 'Masukkan nomor telepon penerima',
                  border: InputBorder.none, // Remove border from the TextField
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 16),

            // Input Jumlah Transfer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Transfer',
                  hintText: 'Masukkan jumlah transfer',
                  border: InputBorder.none, // Remove border from the TextField
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 24),

            // Rekomendasi Jumlah Transfer dalam Grid
            const Text(
              'Rekomendasi Jumlah:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 60,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: recommendedAmounts.length,
              itemBuilder: (context, index) {
                final amount = recommendedAmounts[index];
                return GestureDetector(
                  onTap: () {
                    amountController.text = amount.toStringAsFixed(0).toString();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(color: Colors.blue.shade200), // Border untuk item
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        amount.toIDRCurrencyFormat(),
                        style: Typogaphy.Regular.copyWith(fontSize: 14), // Ukuran font sedikit lebih besar
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          title: "Proses",
          onPressed: () {
            // Logika untuk transfer e-wallet
            if (phoneController.text.isNotEmpty && amountController.text.isNotEmpty) {
              print('Transfer ke ${phoneController.text} sejumlah ${amountController.text}');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Harap lengkapi semua field.')),
              );
            }
          },
        ),
      ),
    );
  }
}

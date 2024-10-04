import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/presentation/extensions/build_context_extension.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/misc/utils.dart';
import 'package:waste_exchange/presentation/pages/contacts/contacts_page.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';

class EWalletTransferPage extends ConsumerStatefulWidget {
  final EWallet eWallet;
  const EWalletTransferPage({super.key, required this.eWallet});

  @override
  ConsumerState<EWalletTransferPage> createState() => _EWalletTransferPageState();
}

class _EWalletTransferPageState extends ConsumerState<EWalletTransferPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Daftar rekomendasi jumlah transfer
  final List<double> recommendedAmounts = [10000, 25000, 50000, 100000];

  Future<void> _selectContact() async {
    // Request permission to read contacts
    PermissionStatus permissionStatus = await Permission.contacts.request();

    if (permissionStatus.isGranted) {
      if (mounted) {
        final Contact? contact = await Navigator.of(context).push<Contact>(
          MaterialPageRoute(builder: (context) => const ContactsPage()),
        );

        if (contact != null && contact.phones!.isNotEmpty) {
          // Filter out non-numeric characters from the phone number
          String? rawPhoneNumber = contact.phones!.first.value;
          String cleanedPhoneNumber = rawPhoneNumber?.replaceAll(RegExp(r'[^0-9+]'), '') ?? '';

          // Replace +62 with 0 if the phone number starts with +62
          if (cleanedPhoneNumber.startsWith('+62')) {
            cleanedPhoneNumber = cleanedPhoneNumber.replaceFirst('+62', '0');
          }

          _phoneController.text = cleanedPhoneNumber;
        }
      }
    } else {
      if (mounted) {
        context.showSnackBar("Permission to access contacts is denied.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.eWallet.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Nomor Telepon
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Telepon',
                        hintText: 'Masukkan nomor telepon penerima',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.contacts),
                  onPressed: _selectContact, // Navigate to contact selection page
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Input Jumlah Transfer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  border: InputBorder.none,
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
                    amountController.text = amount.toStringAsFixed(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        amount.toIDRCurrencyFormat(),
                        style: Typogaphy.Regular.copyWith(fontSize: 12),
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
            if (_phoneController.text.isNotEmpty && amountController.text.isNotEmpty) {
              printIfDebug('Transfer ke ${_phoneController.text} sejumlah ${amountController.text}');
            } else {
              context.showSnackBar("Harap lengkapi semua field.");
            }
          },
        ),
      ),
    );
  }
}

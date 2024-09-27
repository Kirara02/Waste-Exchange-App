import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/pages/credit/section/credit_item.dart';
import 'package:waste_exchange/presentation/providers/withdraw/credits_provider.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';

class CreditPage extends ConsumerStatefulWidget {
  const CreditPage({super.key});

  @override
  ConsumerState<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends ConsumerState<CreditPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose(); // Membersihkan controller saat widget dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final credits = ref.watch(creditsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "Top Up Pulsa"),
      body: ListView(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 24),
        children: [
          Container(
            width: AppScreens.width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                hintText: 'Masukkan nomor telepon',
                border: InputBorder.none,
                suffixIcon: Visibility(
                  visible: _phoneController.text.isNotEmpty,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _phoneController.clear();
                      ref.invalidate(creditsProvider); // Reset state provider
                    },
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                if (value.isEmpty) {
                  ref.invalidate(creditsProvider); // Reset state provider when value is empty
                }
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  ref.read(creditsProvider.notifier).getCredits(phone: _phoneController.text);
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          if (_phoneController.text.isEmpty)
            SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  "Masukkan nomor telepon untuk melihat pilihan pulsa.",
                  style: Typogaphy.Medium,
                ),
              ),
            )
          else
            credits.when(
              data: (creditList) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: creditList.length,
                  itemBuilder: (context, index) {
                    final credit = creditList[index];
                    return CreditItem(credit: credit);
                  },
                );
              },
              loading: () => Center(
                child: Lottie.asset("assets/lotties/loading.json"),
              ),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
        ],
      ),
    );
  }
}

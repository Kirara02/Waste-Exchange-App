import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:waste_exchange/presentation/pages/e_wallet/section/ewallet_item.dart';
import 'package:waste_exchange/presentation/providers/withdraw/ewallets_provider.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';

class EWalletPage extends ConsumerWidget {
  const EWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ewallets = ref.watch(ewalletsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "Top Up E-Wallet"),
      body: ewallets.when(
        data: (ewalletList) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: List.generate(ewalletList.length, (index) {
                  final ewallet = ewalletList[index];
                  return Column(
                    children: [
                      EwalletItem(ewallet: ewallet), // Mengirim data ewallet ke item
                      if (index != ewalletList.length - 1)
                        Container(
                          height: 1, // Tinggi garis
                          color: Colors.grey.shade300, // Warna garis
                        ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
        loading: () => Center(
          child: Lottie.asset("assets/lotties/loading.json"),
        ),
        error: (error, stackTrace) => Center(child: Text('Error: $error')), // Error state
      ),
    );
  }
}

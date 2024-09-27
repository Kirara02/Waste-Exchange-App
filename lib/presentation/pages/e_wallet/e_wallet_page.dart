import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Import skeletonizer
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/misc/utils.dart';
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

// Widget untuk skeleton item
class EwalletSkeletonItem extends StatelessWidget {
  const EwalletSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: Container(
            width: 52,
            height: 40,
            color: Colors.grey.shade300, // Skeleton untuk icon
          ),
          title: Container(
            height: 16,
            color: Colors.grey.shade300, // Skeleton untuk nama e-wallet
          ),
        ),
      ),
    );
  }
}

class EwalletItem extends StatelessWidget {
  final EWallet ewallet; // Data ewallet yang akan ditampilkan

  const EwalletItem({super.key, required this.ewallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Image.asset(
          ewallet.iconPath,
          width: 52,
          height: 40,
        ), // Icon untuk e-wallet
        title: Text(
          ewallet.name,
          style: Typogaphy.Medium,
        ), // Nama e-wallet
        onTap: () {
          printIfDebug(ewallet.id);
        },
      ),
    );
  }
}

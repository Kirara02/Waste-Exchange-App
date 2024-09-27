import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';

class EwalletItem extends ConsumerWidget {
  final EWallet ewallet; // Data ewallet yang akan ditampilkan

  const EwalletItem({super.key, required this.ewallet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        onTap: () => ref.read(routerProvider).push(Routes.EWALLETTRANSFER, extra: ewallet),
      ),
    );
  }
}

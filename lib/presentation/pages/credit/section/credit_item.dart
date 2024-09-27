import 'package:flutter/material.dart';
import 'package:waste_exchange/domain/entities/credit.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';

class CreditItem extends StatelessWidget {
  final Credit credit;

  const CreditItem({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            credit.amount.toSimpleCurrencyFormat(),
            style: Typogaphy.SemiBold.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Harga: ${credit.price.toIDRCurrencyFormat()}',
            style: Typogaphy.Regular.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

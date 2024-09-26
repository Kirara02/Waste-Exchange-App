import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';

class HistoryItem extends StatelessWidget {
  final String title;
  final String datetime;
  final double amount;
  final String type;
  const HistoryItem({super.key, required this.title, required this.datetime, required this.amount, required this.type});

  String _iconType(String type) {
    String iconPath = "assets/icons";
    switch (type) {
      case "topup":
        return "$iconPath/top_up.svg";
      case "transfer":
        return "$iconPath/wallet.svg";
      case "pulsa":
        return "$iconPath/cellphone.svg";
      case "data":
        return "$iconPath/internet.svg";
      default:
        return iconPath;
    }
  }

  String _formatDateTime(String datetime) {
    DateTime dateTimeParsed = DateTime.parse(datetime);
    return DateFormat('d MMMM yyyy, HH:mm').format(dateTimeParsed);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.secondary,
              ),
            ),
            child: SvgPicture.asset(
              _iconType(type),
              width: 20,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Typogaphy.Medium,
                ),
                Text(
                  _formatDateTime(datetime),
                  style: Typogaphy.Regular.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            amount.toIDRCurrencyFormat(),
            style: Typogaphy.Medium.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}

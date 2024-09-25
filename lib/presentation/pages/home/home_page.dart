import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 318,
          padding: const EdgeInsets.only(right: 20, left: 20, top: 42, bottom: 24),
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: AppColors.primaryExtraSoft,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Hello,\n${ref.read(userDataProvider).valueOrNull?.name}",
                      style: Typogaphy.SemiBold.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pattern-1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: AppScreens.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff5033A4),
                        const Color(0xff331098).withOpacity(0.65),
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topRight,
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saldo",
                                  textAlign: TextAlign.right,
                                  style: Typogaphy.Regular.copyWith(
                                    fontSize: 12,
                                    color: const Color(0xffB2A1E4),
                                  ),
                                ),
                                Text(
                                  "Rp 50.000",
                                  style: Typogaphy.SemiBold.copyWith(
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                              width: 90,
                              child: ElevatedButton(
                                style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Riwayat",
                                      style: Typogaphy.Regular.copyWith(fontSize: 12),
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/arrow-right.svg",
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Penukaran Bulan Ini",
                        style: Typogaphy.Regular.copyWith(
                          fontSize: 12,
                          color: const Color(0xffB2A1E4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp 12.000",
                        style: Typogaphy.Medium.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 16),
          child: Container(
            width: AppScreens.width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FeatureItem(
                  title: "Top Up\nE-wallet",
                  iconPath: "assets/icons/wallet.svg",
                  onPressed: () {},
                ),
                FeatureItem(
                  title: "Top Up\nPulsa",
                  iconPath: "assets/icons/internet.svg",
                  onPressed: () {},
                ),
                FeatureItem(
                  title: "Top Up\nData",
                  iconPath: "assets/icons/cellphone.svg",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: Container(
            width: AppScreens.width,
            // height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History Terbaru", style: Typogaphy.SemiBold),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lihat Semua",
                        style: Typogaphy.Medium.copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const HistoryItem(
                      title: "Top Up",
                      datetime: "12 September 2023, 11:20",
                      amount: 15000,
                      type: "topup",
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onPressed;
  const FeatureItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 52,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 36,
            ),
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Typogaphy.Thin.copyWith(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Typogaphy.Medium,
                ),
                Text(
                  datetime,
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

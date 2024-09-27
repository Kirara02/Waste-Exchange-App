import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/history/histories_provider.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';
import 'package:waste_exchange/presentation/widgets/common/history_item.dart';
import 'package:waste_exchange/presentation/widgets/common/history_item_skeleton.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesAsync = ref.watch(historiesProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(historiesProvider.notifier).getHistories();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 68),
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
                                  onPressed: () => ref.read(routerProvider).push(Routes.HISTORIES),
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
                    onPressed: () => ref.read(routerProvider).push(Routes.EWALLET),
                  ),
                  FeatureItem(
                    title: "Top Up\nPulsa",
                    iconPath: "assets/icons/internet.svg",
                    onPressed: () => ref.read(routerProvider).push(Routes.CREDIT),
                  ),
                  FeatureItem(
                    title: "Top Up\nData",
                    iconPath: "assets/icons/cellphone.svg",
                    onPressed: () => ref.read(routerProvider).push(Routes.DATAPLAN),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Container(
              width: AppScreens.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("History Terbaru", style: Typogaphy.SemiBold),
                        TextButton(
                          onPressed: () => ref.read(routerProvider).push(Routes.HISTORIES),
                          child: Text(
                            "Lihat Semua",
                            style: Typogaphy.Medium.copyWith(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  historiesAsync.when(
                    data: (historyData) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
                        itemCount: historyData.isNotEmpty ? min(historyData.length, 5) : 5,
                        separatorBuilder: (context, index) => const Divider(thickness: 0.3),
                        itemBuilder: (context, index) {
                          if (historyData.isEmpty) {
                            return const HistoryItemSkeleton();
                          } else {
                            var item = historyData[index];
                            return HistoryItem(
                              title: item.title,
                              datetime: item.datetime,
                              amount: item.amount,
                              type: item.type,
                            );
                          }
                        },
                      );
                    },
                    loading: () => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
                      itemCount: 5,
                      separatorBuilder: (context, index) => const Divider(thickness: 0.3),
                      itemBuilder: (context, index) => const HistoryItemSkeleton(),
                    ),
                    error: (error, stack) => Center(child: Text("Terjadi kesalahan: $error")),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
              width: 32,
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

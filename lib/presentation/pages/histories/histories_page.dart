import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:waste_exchange/domain/entities/history.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/history/histories_provider.dart';
import 'package:waste_exchange/presentation/widgets/common/history_item.dart';
import 'package:waste_exchange/presentation/widgets/common/history_item_skeleton.dart';

class HistoriesPage extends ConsumerWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesAsync = ref.watch(historiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Penukaran"),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(historiesProvider.notifier).getHistories();
        },
        child: historiesAsync.when(
          data: (historyData) {
            if (historyData.isEmpty) {
              return const Center(child: Text("Tidak ada riwayat penukaran"));
            } else {
              // Group the history data by month and year
              final groupedHistory = _groupByMonth(historyData);

              return ListView.builder(
                itemCount: groupedHistory.keys.length,
                itemBuilder: (context, index) {
                  final monthKey = groupedHistory.keys.elementAt(index);
                  final itemsInMonth = groupedHistory[monthKey]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Month Header
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              monthKey.split(' ')[0],
                              style: Typogaphy.SemiBold.copyWith(fontSize: 18),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              monthKey.split(' ')[1],
                              style: Typogaphy.SemiBold.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      // List of history items for that month
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(), // to avoid nested scrolling
                          shrinkWrap: true, // to allow it to wrap the content
                          itemCount: itemsInMonth.length,
                          separatorBuilder: (context, index) => const Divider(thickness: 0.3),
                          itemBuilder: (context, itemIndex) {
                            final item = itemsInMonth[itemIndex];
                            return HistoryItem(
                              title: item.title,
                              datetime: item.datetime,
                              amount: item.amount,
                              type: item.type,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
          loading: () => ListView.builder(
            itemCount: 5, // Number of months to show
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MonthHeaderSkeleton(), // Month header skeleton
                  // Skeleton items for that month
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(), // to avoid nested scrolling
                      shrinkWrap: true, // to allow it to wrap the content
                      itemCount: 3, // Number of skeleton items to show for each month
                      separatorBuilder: (context, index) => const Divider(thickness: 0.3),
                      itemBuilder: (context, itemIndex) => const HistoryItemSkeleton(),
                    ),
                  ),
                ],
              );
            },
          ),
          error: (error, stack) => Center(child: Text("Terjadi kesalahan: $error")),
        ),
      ),
    );
  }

  // Function to group the history data by month and year
  Map<String, List<History>> _groupByMonth(List<History> historyData) {
    final Map<String, List<History>> groupedHistory = {};

    for (var item in historyData) {
      final monthYear =
          DateFormat("MMM yyyy").format(DateTime.parse(item.datetime)); // Format as "Month Year" e.g. "September 2024"

      if (groupedHistory.containsKey(monthYear)) {
        groupedHistory[monthYear]!.add(item);
      } else {
        groupedHistory[monthYear] = [item];
      }
    }

    // Sort each list of history items by date in descending order
    groupedHistory.forEach((key, value) {
      value.sort((a, b) => DateTime.parse(b.datetime).compareTo(DateTime.parse(a.datetime)));
    });

    return groupedHistory;
  }
}


class MonthHeaderSkeleton extends StatelessWidget {
  const MonthHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 30, // Adjust the width as needed
            height: 20,
            color: Colors.grey[300], // Skeleton color
          ),
          const SizedBox(width: 4),
          Container(
            width: 30, // Adjust the width as needed
            height: 15,
            color: Colors.grey[300], // Skeleton color
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waste_exchange/domain/entities/data_plan.dart';
import 'package:waste_exchange/presentation/extensions/double_extension.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';

class DataPlanItem extends StatefulWidget {
  final DataPlan dataPlan;
  const DataPlanItem({super.key, required this.dataPlan});

  @override
  State<DataPlanItem> createState() => _DataPlanItemState();
}

class _DataPlanItemState extends State<DataPlanItem> {
  bool isExpanded = false; // Menyimpan state apakah deskripsi diperluas atau tidak

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row untuk menampilkan nama paket dan harga di kanan
            Row(
              children: [
                Text(
                  widget.dataPlan.name,
                  style: Typogaphy.SemiBold.copyWith(fontSize: 16),
                ),
                const Spacer(), // Spacer digunakan untuk mendorong harga ke sisi kanan
                Text(
                  widget.dataPlan.price.toIDRCurrencyFormat(),
                  style: Typogaphy.Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Masa Berlaku: ${widget.dataPlan.expired}',
              style: Typogaphy.Regular.copyWith(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Expandable Deskripsi (hanya tampil jika isExpanded == true)
            if (widget.dataPlan.desc != null && widget.dataPlan.desc!.isNotEmpty)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded; // Toggle antara expand dan collapse
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isExpanded)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.dataPlan.desc!,
                            style: Typogaphy.Regular.copyWith(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),

                    // Teks "Lihat keterangan" dan panah yang sesuai
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isExpanded ? "Sembunyikan keterangan" : "Lihat keterangan",
                          style: Typogaphy.SemiBold.copyWith(fontSize: 12, color: Colors.blue),
                        ),
                        Icon(
                          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

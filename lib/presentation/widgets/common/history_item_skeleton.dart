import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryItemSkeleton extends StatelessWidget {
  const HistoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            // Skeleton for the icon
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            // Skeleton for title and datetime
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skeleton for the title
                  Container(
                    height: 16,
                    width: 150,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 8),
                  // Skeleton for the datetime
                  Container(
                    height: 12,
                    width: 100,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Skeleton for amount
            Container(
              height: 16,
              width: 60,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}

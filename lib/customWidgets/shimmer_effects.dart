import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPageShimmerEffect extends StatelessWidget {
  const HistoryPageShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top row: Image, Vehicle no, datetime, status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vehicle Image placeholder
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Vehicle No
                            Container(
                              height: 14.h,
                              width: 120.w,
                              color: Colors.white,
                            ),
                            SizedBox(height: 6.h),
                            // Date time
                            Container(
                              height: 12.h,
                              width: 100.w,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Status badge
                      Container(
                        height: 24.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Rate & Review title
                  Container(height: 12.h, width: 80.w, color: Colors.white),

                  SizedBox(height: 10.h),

                  // Stars (5)
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          height: 18.h,
                          width: 18.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 14.h),

                  // Get Report button
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HistoryDetailShimmerEffect extends StatelessWidget {
  const HistoryDetailShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Placeholder
            Container(
              height: 180,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 12),

            // Date & Order ID
            Container(
              height: 14,
              width: 140,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            Container(
              height: 14,
              width: 180,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            const SizedBox(height: 16),

            // Source & Destination Info
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Source
                  Row(
                    children: [
                      CircleAvatar(radius: 6, backgroundColor: Colors.green),
                      const SizedBox(width: 8),
                      Container(
                        height: 12,
                        width: width * 0.6,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Destination
                  Row(
                    children: [
                      CircleAvatar(radius: 6, backgroundColor: Colors.red),
                      const SizedBox(width: 8),
                      Container(
                        height: 12,
                        width: width * 0.6,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Distance & Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(height: 12, width: 60, color: Colors.white),
                          const SizedBox(height: 4),
                          Container(height: 10, width: 40, color: Colors.white),
                        ],
                      ),
                      Column(
                        children: [
                          Container(height: 12, width: 60, color: Colors.white),
                          const SizedBox(height: 4),
                          Container(height: 10, width: 40, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Delivery Manager + Rating
            Row(
              children: [
                CircleAvatar(radius: 20, backgroundColor: Colors.white),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 14, width: 120, color: Colors.white),
                    const SizedBox(height: 6),
                    Container(height: 10, width: 80, color: Colors.white),
                  ],
                ),
                Spacer(),
                // Stars
                Row(
                  children: List.generate(
                    5,
                    (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.star, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TodayDeliveryShimmerEffect extends StatelessWidget {
  const TodayDeliveryShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Heading: "Hi Blue Tokai!"
            Container(height: 20, width: 160, color: Colors.white),
            const SizedBox(height: 20),

            // Subheading: "Today Deliveries"
            Container(height: 14, width: 120, color: Colors.white),
            const SizedBox(height: 16),

            // Delivery Card List - 4 items
            ...List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Circle Avatar Placeholder
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // City name + Active Deliveries tag
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14,
                            width: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 12,
                            width: 140,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),

                    // Arrow Icon Placeholder
                    Icon(Icons.chevron_right, color: Colors.white, size: 24),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class TextShimmerEffect extends StatelessWidget {
  final double height, width;
  final double? verticalMargin;
  const TextShimmerEffect({
    super.key,
    required this.height,
    required this.width,
    this.verticalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height.sp, // roughly same as font size
        width: width.sp,
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin ?? 0.0,
        ), // expected width of text
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

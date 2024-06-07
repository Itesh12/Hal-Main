import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserTileShimmer extends StatelessWidget {
  const UserTileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
              highlightColor: Colors.grey[100]!,
              baseColor: Colors.grey[200]!,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 10,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        itemCount: 10);
  }
}

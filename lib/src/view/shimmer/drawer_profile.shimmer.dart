import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DrawerProfileShimmer extends StatelessWidget {
  const DrawerProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 69,
                      width: 69,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 16,
                                width: 107,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey)),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Container(
                                height: 12,
                                width: 73,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              height: 12,
                              width: 63,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

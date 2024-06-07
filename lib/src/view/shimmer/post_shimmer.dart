import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        for (int i = 1; i < 5; i++)
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    children: [
                      Container(
                        height: 37,
                        width: 37,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14.h,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 11.h,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_vert,
                        size: 24.h,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(color: Colors.grey)),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      12.horizontalSpace,
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      12.horizontalSpace,
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 5,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
              )
            ],
          ),
        const SizedBox(height: 15),
      ],
    );
  }
}

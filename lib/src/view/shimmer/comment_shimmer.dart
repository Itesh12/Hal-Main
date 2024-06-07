import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommentShimmer extends StatelessWidget {
  const CommentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
              highlightColor: Colors.grey[100]!,
              baseColor: Colors.grey[200]!,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: 10);
  }
}

class ReplyShimmer extends StatelessWidget {
  const ReplyShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[200]!,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            const SizedBox(width: 30),
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}

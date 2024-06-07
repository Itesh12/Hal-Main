import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmer extends StatelessWidget {
  const WeatherShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[200]!,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          width: double.maxFinite,
          height: 162,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

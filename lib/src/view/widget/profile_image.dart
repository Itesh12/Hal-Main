import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget(
      {Key? key,
      this.url,
      this.size = 100,
      this.fizedSize = false,
      this.hasShadow = false,
      this.hasBorder = false,
      this.border})
      : super(key: key);

  final String? url;
  final double size;
  final Border? border;
  final bool hasShadow;
  final bool fizedSize;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fizedSize ? size : size.h,
      width: fizedSize ? size : size.h,
      decoration: BoxDecoration(
        border: hasBorder
            ? border ??
                Border.all(
                  width: 3,
                  color: whitePrimary,
                )
            : null,
        shape: BoxShape.circle,
        boxShadow: [
          if (hasShadow)
            const BoxShadow(
              offset: Offset(4, 4),
              spreadRadius: 4,
              blurRadius: 12,
              color: Color(0x14883302),
            ),
        ],
        image: url != null
            ? DecorationImage(
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage('assets/images/profile_b.png')),
      ),
    );
  }
}

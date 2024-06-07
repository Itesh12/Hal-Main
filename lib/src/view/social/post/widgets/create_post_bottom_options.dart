import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/colors.dart';

class CreatePostBottomOption extends StatelessWidget {
  const CreatePostBottomOption(
      {Key? key, required this.icon, required this.label, this.onTap})
      : super(key: key);
  final String icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: SvgPicture.asset(icon),
      ),
      title: Text(
        label,
        style: textTheme.titleSmall!.copyWith(color: brown),
      ),
      onTap: onTap ?? () {},
    );
  }
}

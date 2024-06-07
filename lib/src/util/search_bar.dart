import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget searchbar(
    {required TextEditingController textEditingController,
    required Color fillcolor,
    required String hintText,
    required Function(String) onchanged}) {
  return TextFormField(
      // autofillHints: autofillHints,
      // keyboardType: ,
      onChanged: onchanged,
      textInputAction: TextInputAction.done,
      // validator: validator,
      controller: textEditingController,
      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      // inputFormatters: [LengthLimitingTextInputFormatter(maxText)],
      // maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
          child: SvgPicture.asset("assets/images/search.svg"),
        ),
        // suffixIcon: Align(
        //   widthFactor: 1.0,
        //   heightFactor: 1.0,
        //   child: SvgPicture.asset("assets/images/mic.svg"),
        // ),

        // isCollapsed: true,
        isDense: true,
        fillColor: fillcolor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0xffEAEAEA),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(0x5F563F1F),
        ),
      ));
}

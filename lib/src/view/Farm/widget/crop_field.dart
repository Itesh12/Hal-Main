import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class CropTextField extends StatelessWidget {
  const CropTextField({
    Key? key,
    this.validator,
    this.textController,
    this.hintText,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxlines,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final int? maxlines;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      onChanged: onChanged ?? (val) {},
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxlines,
      controller: textController,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: whitePrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0xffF4F4F4),
          ),
        ),
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xffF4F4F4),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        hintStyle: textTheme.bodyLarge!
            .copyWith(color: hintTextColor, fontSize: 12.sp),
        hintText: hintText,
        suffixIconConstraints: BoxConstraints(maxHeight: 35.h),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

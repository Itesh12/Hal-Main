import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<T?> buildShowModalBottomSheet<T>(
  BuildContext context,
  Widget Function(ScrollController controller) builder, {
  double initialHeight = 0.9,
  Color bottomsheetcolor = Colors.white,
  bool useRootNavigator = true,
}) {
  return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return makeDismissable(
          context: context,
          child: DraggableScrollableSheet(
              initialChildSize: initialHeight,
              maxChildSize: 0.9,
              minChildSize: 0.2,
              builder: (context, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: bottomsheetcolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Container(
                        height: 6.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffCECECE),
                            borderRadius: BorderRadius.circular(4.5.r)),
                      ),
                      Expanded(child: builder(controller))
                    ],
                  ),
                );
              }),
        );
      });
}

Widget makeDismissable(
        {required Widget child, required BuildContext context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: child,
    );

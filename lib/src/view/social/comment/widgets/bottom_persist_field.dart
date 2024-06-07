import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../util/services/shared_preferences.dart';
import '../../../widget/profile_image.dart';

class BottomPersistField extends StatefulWidget {
  const BottomPersistField({
    Key? key,
    required this.hintText,
    required this.onTap,
    this.isTyping = true,
  }) : super(key: key);

  final String hintText;
  final bool isTyping;
  final Function(String) onTap;

  @override
  _BottomPersistFieldState createState() => _BottomPersistFieldState();
}

class _BottomPersistFieldState extends State<BottomPersistField> {
  final TextEditingController _commentDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF8F8F8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
            child: ProfilePicWidget(
              url: UserPreferences.profilePic,
              size: 28,
              fizedSize: true,
            ),
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.send,
              onSubmitted: (string) {},
              controller: _commentDesc,
              autofocus: widget.isTyping,
              minLines: 1,
              maxLines: 10,
              style: TextStyle(fontSize: 15.sp),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Color(0xffCACACA)),
              ),
            ),
          ),
          20.horizontalSpace,
          Material(
            color: const Color(0xffF8F8F8),
            child: InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await widget.onTap(_commentDesc.text);
                _commentDesc.clear();
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10.w),
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 14.sp, color: primary),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

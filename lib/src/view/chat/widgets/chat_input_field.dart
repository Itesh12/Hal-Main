import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  ChatInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                hintText: 'Type something...',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}

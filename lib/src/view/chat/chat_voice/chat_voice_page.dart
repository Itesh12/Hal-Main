import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatVoiceScreen extends StatelessWidget {
  const ChatVoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/call.svg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: const BoxDecoration(color: Colors.black),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          const Center(
            child: CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Itesh Ambre',
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          SizedBox(height: 5.h),
          Text(
            'Connecting...',
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}

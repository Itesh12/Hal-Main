import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/model/chat/chat_model.dart';
import 'package:kisaan_station/src/view/chat/chat_page.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  final List<ChatListModel> chatList = <ChatListModel>[
    ChatListModel(
        userId: 1,
        lastMessage: 'Hello',
        lastSeen: 'Seen 2 hr ago',
        userName: 'Itesh'),
    ChatListModel(
        userId: 1,
        lastMessage: 'Thank You',
        lastSeen: 'Seen 6 hr ago',
        userName: 'Ravi'),
    ChatListModel(
        userId: 1,
        lastMessage: 'Hi',
        lastSeen: 'Seen 16 mins ago',
        userName: 'Kartik'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final ChatListModel chatListData = chatList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatListData.userName,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          chatListData.lastMessage,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          chatListData.lastSeen,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemCount: chatList.length),
    );
  }
}

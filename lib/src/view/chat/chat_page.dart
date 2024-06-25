import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/controller/chat/chat_controller.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/chat/chat_voice/chat_voice_page.dart';
import 'package:kisaan_station/src/view/chat/widgets/chat_input_field.dart';

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMessages = ref.watch(chatProvider);

    final user = ref.read(userController(UserPreferences.userId)).value;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10.w),
            Text(
              user?.name ?? 'User',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatVoiceScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.call_outlined,
                color: Colors.black,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatVoiceScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.video_call_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return chatMessages[index];
              },
            ),
          ),
          ChatInputField(
            controller: ref.read(chatProvider.notifier).textController,
            onSend: () => ref.read(chatProvider.notifier).sendMessage(
                  ref.read(chatProvider.notifier).textController.text,
                ),
          ),
        ],
      ),
    );
  }
}

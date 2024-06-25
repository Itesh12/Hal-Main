import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/view/chat/widgets/chat_message.dart';

final chatProvider = StateNotifierProvider<ChatController, List<ChatMessage>>(
    (ref) => ChatController());

class ChatController extends StateNotifier<List<ChatMessage>> {
  ChatController() : super([]);
  TextEditingController textController = TextEditingController();

  void sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      state = [
        ...state,
        ChatMessage(
          message: message,
          isSender: true,
        ),
      ];
      textController.clear();
    }
  }
}

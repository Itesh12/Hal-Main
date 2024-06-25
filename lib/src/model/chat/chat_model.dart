// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

List<ChatListModel> chatListModelFromJson(String str) =>
    List<ChatListModel>.from(
        json.decode(str).map((x) => ChatListModel.fromJson(x)));

String chatListModelToJson(List<ChatListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatListModel {
  final int userId;
  final String lastMessage;
  final String lastSeen;
  final String userName;

  ChatListModel({
    this.userId = 0,
    this.lastMessage = '',
    this.lastSeen = '',
    this.userName = '',
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        userId: json["userId"] ?? '',
        lastMessage: json["lastMessage"] ?? '',
        lastSeen: json["lastSeen"] ?? '',
        userName: json["userName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "lastMessage": lastMessage,
        "lastSeen": lastSeen,
        "userName": userName,
      };
}

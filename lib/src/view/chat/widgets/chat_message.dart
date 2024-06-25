import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSender;
  final String? imageUrl;

  ChatMessage({
    required this.message,
    required this.isSender,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            if (imageUrl != null) const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

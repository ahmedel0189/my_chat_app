import 'package:a_chat/constants/my_color.dart';
import 'package:flutter/material.dart';

class WidgetsOfHomePage {
  Widget buildMassageTextField({
    required VoidCallback onPressed,
        required TextEditingController controller,

  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // TextField
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send Button
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBubbleMassage({
    required String message,
    required bool
    isMe, // true لو أنا اللي باعت الرسالة
  }) {
    return Align(
      alignment: isMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        height: 65,
        width: 250,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? MyColor.myblue
              : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe
                ? const Radius.circular(16)
                : const Radius.circular(0),
            bottomRight: isMe
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe
                ? Colors.white
                : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

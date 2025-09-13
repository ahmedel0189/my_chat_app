import 'package:flutter/material.dart';

class WidgetsOfHomePage {
  Widget buildMassageTextField({VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // TextField
          Expanded(
            child: TextField(
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
}

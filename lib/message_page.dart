import 'dart:async';

import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // Controller to read and clear the text box
  final TextEditingController messageController =
  TextEditingController();

  // Message that will be displayed
  String lastMessage = 'No message delivered yet.';

  // Used to show the empty-input alert
  bool showAlert = false;

  void submitMessage() {
    // Get text from the input box
    String message = messageController.text.trim();

    // Check if the input is empty
    if (message.isEmpty) {
      setState(() {
        showAlert = true;
      });

      // Hide alert after 2 seconds
      Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            showAlert = false;
          });
        }
      });

      return;
    }

    // Display submitted message
    setState(() {
      lastMessage = message;
      showAlert = false;
    });

    // Clear the text box
    messageController.clear();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Enter Message',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: messageController,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your message',
              ),

              // Detect Enter key
              onSubmitted: (value) {
                submitMessage();
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'Last Message Delivered',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            if (showAlert)
              const Text(
                'Please enter a message.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              )
            else
              Text(
                lastMessage,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
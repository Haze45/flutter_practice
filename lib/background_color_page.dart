import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundColorPage extends StatefulWidget {
  const BackgroundColorPage({super.key});

  @override
  State<BackgroundColorPage> createState() => _BackgroundColorPageState();
}

class _BackgroundColorPageState extends State<BackgroundColorPage> {
  Color backgroundColor = Colors.white;

  void changeBackgroundColor() {
    final random = Random();

    setState(() {
      backgroundColor = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: const Text('Change Background Color'),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: changeBackgroundColor,
          child: const Text('Change Background Color'),
        ),
      ),
    );
  }
}
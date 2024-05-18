import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          "To be designed soon.....",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

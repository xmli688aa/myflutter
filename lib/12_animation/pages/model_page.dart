import 'package:flutter/material.dart';

class HYModalPage extends StatelessWidget {
  const HYModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Modal Page"),
      ),
      body: const Center(
        child: Text("Modal Page"),
      ),
    );
  }
}

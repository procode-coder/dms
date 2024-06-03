import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Riverpod extends StatelessWidget {
  const Riverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: const Column(
        children: [Text("data")],
      ),
    );
  }
}

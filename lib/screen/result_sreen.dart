import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int type;
  final int service;
  final int size;
  final double water;
  const ResultScreen(
      {super.key,
      required this.type,
      required this.service,
      required this.size,
      required this.water});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text("Service $service"),
            Text("Type $type"),
            Text("Size $size"),
            Text("water $water")
          ],
        ),
      ),
    );
  }
}

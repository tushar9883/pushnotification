import 'package:flutter/material.dart';

class One extends StatefulWidget {
  const One({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Center(
          child: Text("1rd Page"),
        ),
      ),
    );
  }
}

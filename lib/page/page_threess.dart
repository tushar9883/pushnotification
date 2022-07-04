import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  const Three({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Center(
          child: Text("3rd Page"),
        ),
      ),
    );
  }
}

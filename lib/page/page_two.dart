import 'package:flutter/material.dart';

class Two extends StatefulWidget {
  const Two({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Center(
          child: Text("2rd Page"),
        ),
      ),
    );
  }
}

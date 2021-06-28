import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('This is a screen'),
        ),
      ),
    );
  }
}

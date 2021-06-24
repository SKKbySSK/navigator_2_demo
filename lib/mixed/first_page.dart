import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
    required this.pushSecondPage,
  }) : super(key: key);
  final VoidCallback pushSecondPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: pushSecondPage,
          child: Text('Go to second page!'),
        ),
      ),
    );
  }
}

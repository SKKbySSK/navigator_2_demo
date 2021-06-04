import 'package:flutter/material.dart';
import 'package:navigator_2_demo/legacy/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  MaterialPageRoute<void> get secondPage {
    return MaterialPageRoute(
      builder: (context) {
        return SecondPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(secondPage),
          child: Text('Go to second page!'),
        ),
      ),
    );
  }
}

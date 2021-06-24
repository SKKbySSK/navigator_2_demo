import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    required this.popPage,
  }) : super(key: key);
  final VoidCallback popPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('This dialog is very simple'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Pop'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show Dialog (Legacy)'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back! (Legacy)'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: popPage,
              child: Text('Back!'),
            ),
          ],
        ),
      ),
    );
  }
}

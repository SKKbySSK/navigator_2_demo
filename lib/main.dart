import 'package:flutter/material.dart';
import 'package:navigator_2_demo/legacy_navigator_app.dart';
import 'package:navigator_2_demo/mixed_navigator_app.dart';
import 'package:navigator_2_demo/new_navigator_app.dart';

void main() {
  runApp(AppProxy());
}

class AppProxy extends StatefulWidget {
  @override
  _AppProxyState createState() => _AppProxyState();
}

class _AppProxyState extends State<AppProxy> {
  Widget? _app;

  @override
  Widget build(BuildContext context) {
    final app = _app;
    if (app == null) {
      return MaterialApp(
        home: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _app = LegacyNavigatorApp();
                  });
                },
                child: Text('Legacy Mode'),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _app = NewNavigatorApp();
                  });
                },
                child: Text('Navigator 2.0 Mode'),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _app = MixedNavigatorApp();
                  });
                },
                child: Text('Mixed Mode'),
              ),
            ],
          ),
        ),
      );
    }

    return app;
  }
}

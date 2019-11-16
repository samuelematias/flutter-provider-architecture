import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider Architecture',
      theme: ThemeData(),
      initialRoute: '/login',
      onGenerateRoute: Router.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Architecture',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        initialRoute: '/login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      builder: (BuildContext context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (BuildContext context, LoginModel model, Widget child) =>
            Scaffold(
                // backgroundColor: ,
                ),
      ),
    );
  }
}

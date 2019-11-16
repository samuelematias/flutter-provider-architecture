import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/enum/viewstate.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/views/base_view.dart';
import 'package:flutter_provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (BuildContext context, LoginModel model, Widget child) =>
          Scaffold(
        backgroundColor: backgroundColor,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(
                  validationMessage: model.errorMessage,
                  controller: _controller,
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

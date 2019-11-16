import 'package:flutter_provider_architecture/core/enum/viewstate.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);

    var success = await _authenticationService.login(userId);

    // Handle additional error here. Put the abouve login.

    setState(ViewState.Idle);

    return success;
  }
}

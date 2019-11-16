import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/locator.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    return hasUser;
  }
}

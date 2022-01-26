import 'package:app/repositories/user_repository.dart';

class LoginController {
  final UserRepository _userRepository = UserRepository();

  Future login(String email, String password) async {
    final Map<String, String> params = {
      "email": email,
      "password": password
    };

    final response = await _userRepository.login(params);

    return response;
  }
}
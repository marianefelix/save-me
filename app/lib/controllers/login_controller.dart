import 'package:app/repositories/user_repository.dart';

class LoginController {
  final UserRepository _userRepository = UserRepository();

  Future login(Map<String, String> params) async {
    final response = await _userRepository.login(params);

    return response;
  }
}
import 'package:app/repositories/user_repository.dart';

class RegistrationController {
  final UserRepository _userRepository = UserRepository();

  Future createUser(Map<String, String> params) async {
    final response = await _userRepository.createUser(params);
    
    return response;
  }
}
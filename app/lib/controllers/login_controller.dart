import 'package:app/models/user_model.dart';
import 'package:app/repositories/user_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController {
  final UserRepository _userRepository = UserRepository();

  Future login(Map<String, String> params) async {
    final response = await _userRepository.login(params);

    return response;
  }

  Future<UserModel> getUserInfos(String token) async {
    Map<String, dynamic> decodedToken = {};
    UserModel user = UserModel();

    decodedToken = JwtDecoder.decode(token);

    user.id = decodedToken["sub"];
    user.name = decodedToken["name"];
    user.email = decodedToken["email"];

    return user;
  }
}
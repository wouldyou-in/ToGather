import 'package:get/get.dart';
import 'package:togather/domain/token.dart';

class TokenController extends GetxController {
  Token token = Token();

  TokenController(accessToken, refreshToken) {
    token.accessToken = accessToken;
    token.refreshToken = refreshToken;
    update();
  }

  String getToken() {
    return token.accessToken;
  }
}

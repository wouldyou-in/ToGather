import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:togather/constant.dart';
import 'package:togather/domain/token_controller.dart';

class NetWorkHelper {
  final String url;

  NetWorkHelper({required this.url});

  Future getReturnStatus() async {
    http.Response response = await http.get(Uri.https(API_ADDRESS, url));
    return response.statusCode;
  }

  Future login(int token) async {
    http.Response response = await http.post(
      Uri.https(API_ADDRESS, url),
      body: jsonEncode(
        <String, dynamic>{
          "email": "lak93@naver.com",
          "token": token,
        },
      ),
    );
    if (response.statusCode == 200) {
      dynamic data = response.body;
      Get.put(TokenController(data['access_token'], data["refresh_token"]));
      return 200;
    }
    return 404;
  }
}

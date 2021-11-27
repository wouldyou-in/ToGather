import 'package:get/get.dart';

class NavBarController extends GetxController {
  bool hideNavBar = false;

  void switchStatus() {
    hideNavBar = !hideNavBar;
    update();
  }
}

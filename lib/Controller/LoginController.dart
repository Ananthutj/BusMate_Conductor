import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  void loadingStatus(bool value) {
    isLoading.value = value;
  }
}

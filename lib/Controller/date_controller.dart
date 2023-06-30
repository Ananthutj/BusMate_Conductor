import 'package:get/get.dart';

class DateController extends GetxController {
  var currentDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    ever(currentDate, (_) => currentDate.value = DateTime.now());
  }
}

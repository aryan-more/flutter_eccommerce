import 'package:get/get.dart';

class MainViewController extends GetxController {
  RxInt index = 0.obs;
  void setIndex(int newIndex) {
    if (index.value != newIndex) {
      index.value = newIndex;
    }
  }
}

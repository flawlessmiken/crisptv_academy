import 'package:get/get.dart';

class DefaultController extends GetxController {

  RxBool showDrawer = false.obs;
  RxBool hideDrawer = true.obs;

  void openDrawer() {
    showDrawer.value = true;
  }

  void closeDrawer() {
    hideDrawer.value = true;
  }
}




import 'dart:math';

import 'package:get/get.dart';

class ApprovalsController extends GetxController{
  RxInt page = 1.obs;
  RxInt count = 0.obs;

  RxString textFilter = "".obs;

  RxString refreshCode = "".obs;

  void getRefreshCode (){
    Random random = Random();
    String fields = "abcdefghijklmnopqrstuvwxyz0123456789";
    String code = "";
    for (int i = 0; i < 10; i++) {
      code += fields[random.nextInt(35)];
    }
    refreshCode.value = code;
  }
}
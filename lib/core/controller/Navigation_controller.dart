import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectIndex = 0.obs;
  void changeIndex(int index) {
    selectIndex.value = index;
  }
}

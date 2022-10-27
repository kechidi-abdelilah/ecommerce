import 'package:get/get.dart';

class DataController extends GetxController {
  final categoryName = "".obs ;
  final count = 0.obs;
  changeCategoryName(String a){
    categoryName.value = a ;
    count.value++;
    print("${categoryName.value } ${count.value}");
  }
}

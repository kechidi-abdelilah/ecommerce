import 'package:ecommerce/pages/home/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../favorites/ui/index.dart';
import '../../history/ui/index.dart';
import '../../profile/ui/index.dart';

class BottomNavigatorController extends GetxController {
  RxInt index = 0.obs;
  var views = [
    HomePage(),
    ProfilePage(),
    FavoritesPage(),
    HistoryPage(),
  ];
  void changeIndex(int i) => index.value = i;
}

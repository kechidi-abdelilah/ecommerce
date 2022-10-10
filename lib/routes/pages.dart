import 'package:ecommerce/pages/Categorie/Bindings/category_binding.dart';
import 'package:ecommerce/pages/Categorie/UI/index.dart';
import 'package:ecommerce/pages/cart/bindings/cart_binding.dart';
import 'package:ecommerce/pages/cart/ui/index.dart';
import 'package:ecommerce/pages/detail/ui/index.dart';
import 'package:ecommerce/pages/favorites/ui/index.dart';
import 'package:ecommerce/pages/history/ui/index.dart';
import 'package:ecommerce/pages/home/ui/index.dart';
import 'package:ecommerce/pages/home/ui/widgets/search_box.dart';
import 'package:ecommerce/pages/main/bindings/main_bindings.dart';
import 'package:ecommerce/pages/main/ui/index.dart';
import 'package:ecommerce/pages/search/bindings/search_binding.dart';
import 'package:ecommerce/pages/search/ui/index.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

import '../pages/profile/ui/index.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<HomePage>(
      name: Routes.initial,
      page: () => const Main(),
      binding: MainBindings(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
    GetPage<HomePage>(
      name: Routes.home,
      page: () => HomePage(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
    GetPage<SearchPage>(
      name: Routes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<CartPage>(
      name: Routes.cart,
      page: () => const CartPage(),
      binding: CartBindings(),
      transition: Transition.upToDown,
      preventDuplicates: true,
    ),
    GetPage<CategoriesPage>(
      name: Routes.categories,
      page: () =>  CategoriesPage(),
      binding: CategorieBindings(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<ProfilePage>(
      name: Routes.profile,
      page: () =>  ProfilePage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<FavoritesPage>(
      name: Routes.favorites,
      page: () =>  FavoritesPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<HistoryPage>(
      name: Routes.history,
      page: () =>  HistoryPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
  ];
}

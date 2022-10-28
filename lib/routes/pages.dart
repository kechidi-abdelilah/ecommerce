import 'package:ecommerce/pages/Categorie/Bindings/category_binding.dart';
import 'package:ecommerce/pages/Categorie/UI/index.dart';
import 'package:ecommerce/pages/Waiting/ui/index.dart';
import 'package:ecommerce/pages/cart/bindings/cart_binding.dart';
import 'package:ecommerce/pages/cart/ui/index.dart';
import 'package:ecommerce/pages/detail/ui/index.dart';
import 'package:ecommerce/pages/email_verification/ui/index.dart';
import 'package:ecommerce/pages/favorites/ui/index.dart';
import 'package:ecommerce/pages/forgetpassword/ui/index.dart';
import 'package:ecommerce/pages/history/ui/index.dart';
import 'package:ecommerce/pages/home/ui/index.dart';
import 'package:ecommerce/pages/home/ui/widgets/search_box.dart';
import 'package:ecommerce/pages/main/bindings/main_bindings.dart';
import 'package:ecommerce/pages/main/ui/index.dart';
import 'package:ecommerce/pages/reset_password/binding/ResetPasswordBinding.dart';
import 'package:ecommerce/pages/reset_password/ui/index.dart';
import 'package:ecommerce/pages/search/bindings/search_binding.dart';
import 'package:ecommerce/pages/search/ui/index.dart';
import 'package:ecommerce/pages/splash/ui/index.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

import '../pages/Waiting/bindings/waiting_bindings.dart';
import '../pages/email_verification/bindings/email_verification_binding.dart';
import '../pages/forgetpassword/binding/ForgetPasswordBinding.dart';
import '../pages/login/ui/index.dart';
import '../pages/profile/profile_bindings.dart';
import '../pages/profile/ui/index.dart';
import '../signup/ui/index.dart';

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
      binding: ProfileBindings(),
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
    GetPage<LoginPage>(
      name: Routes.login,
      page: () =>  LoginPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<SignUpPage>(
      name: Routes.signup,
      page: () =>  SignUpPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<SplashPage>(
      name: Routes.splach,
      page: () =>  SplashPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<WaitingPage>(
      name: Routes.waiting,
      page: () =>  WaitingPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
      binding: WaitingBindings(),
    ),
    GetPage<EmailVerificationPage>(
      name: Routes.emailverification,
      page: () =>  EmailVerificationPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
      binding: EmailVerificationBindings(),
    ),
    GetPage<ResetPaswwordPage>(
      name: Routes.resetpassword,
      page: () =>  ResetPaswwordPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
      binding: ResetPasswordBindings(),
    ),
    GetPage<ForgetpasswordPage>(
      name: Routes.forgetpassword,
      page: () =>  ForgetpasswordPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
      binding: ForgetPasswordBindings(),
    ),

  ];
}

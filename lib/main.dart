import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:ecommerce/pages/main/ui/index.dart';
import 'package:ecommerce/pages/splash/ui/index.dart';
import 'package:ecommerce/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  ).then((value) => Get.put(AuthController()));
  print("fire base initialize");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
        primaryColor: Color(0xFFFE3C5B),
        primaryColorDark: Color(0xFFFC0028),
        primaryColorLight: Color(0xFFF9AAA),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Color(0xFFF5F5F5),
        fontFamily: 'Futura',
        textTheme: TextTheme(
          headline1: TextStyle(

          )
        )
      ),
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      home: SplashPage(),
    );
  }
}

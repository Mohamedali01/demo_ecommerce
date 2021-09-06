import 'package:demo_ecommerce/controller/auth_provider.dart';
import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/view/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeController(),
          )
        ],
        builder: (context, snapshot) {
          return GetMaterialApp(
            theme: ThemeData(canvasColor: Colors.white),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}

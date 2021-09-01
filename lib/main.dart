import 'package:demo_ecommerce/controller/auth_provider.dart';
import 'package:demo_ecommerce/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider())
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

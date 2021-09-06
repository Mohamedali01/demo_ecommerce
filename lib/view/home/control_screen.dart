import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/view/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'add_product_screen.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.offAll(SplashScreen());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(
                AddProductScreen(),
              );
            },
            tooltip: 'Add a new Product',
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: homeProvider.currentBottomNavIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          homeProvider.changeBottomNavIndex(index);
        },
      ),
      body: homeProvider.screens[homeProvider.currentBottomNavIndex],
    );
  }
}

import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/auth/sign_in_screen.dart';
import 'package:demo_ecommerce/view/auth/sign_up_screen.dart';
import 'package:demo_ecommerce/widgets/custom_rounded_button.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 60, left: 60, right: 60, bottom: 40),
          child: Column(
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        color: Color(kTextColor),
                        fontSize: defaultSize * 2.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Demo Shop',
                          style: TextStyle(
                              color: Color(kTextColor),
                              fontWeight: FontWeight.bold,
                              fontSize: defaultSize * 2.2),
                        ),
                      ],
                    ),
                  ),
                  CustomText(
                    'Explore Us',
                    color: Color(kTextColor),
                    fontSize: defaultSize * 1.8,
                  ),
                ],
              ),
              // Spacer(),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/splash_image.svg',
                    height: defaultSize*25,
                    width: defaultSize*25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Column(
                children: [
                  CustomRoundedButton(
                    height: defaultSize * 4.5,
                    onPressed: () {
                      Get.to(SignInScreen());
                    },
                    width: double.infinity,
                    color: Color(kButtonColor),
                    child: CustomText(
                      'Login',
                      color: Colors.white,
                      fontSize: defaultSize * 1.7,
                    ),
                  ),
                  CustomRoundedButton(
                    height: defaultSize * 4,
                    width: double.infinity,
                    color: Colors.transparent,
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: CustomText(
                      'Signup',
                      fontSize: defaultSize * 1.7,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/sign_in_screen.dart';
import 'package:demo_ecommerce/view/sign_up_screen.dart';
import 'package:demo_ecommerce/widgets/custom_rounded_button.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
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
          padding: const EdgeInsets.all(60.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeConfig.orientation == Orientation.portrait
                  ? SizeConfig.screenHeight * 0.825:SizeConfig.screenWidth *0.825,
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
                      SizedBox(
                        height: defaultSize * 1.5,
                      ),
                      CustomText(
                        'Explore Us',
                        color: Color(kTextColor),
                        fontSize: defaultSize * 1.8,
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/images/splash_image.svg'),
                  Spacer(),
                  Column(
                    children: [
                      CustomRoundedButton(
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
        ),
      ),
    );
  }
}

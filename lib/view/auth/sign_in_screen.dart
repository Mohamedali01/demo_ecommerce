import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/controller/auth_provider.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/auth/sign_up_screen.dart';
import 'package:demo_ecommerce/view/auth/splash_screen.dart';
import 'package:demo_ecommerce/view/home/control_screen.dart';
import 'package:demo_ecommerce/widgets/custom_rounded_button.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:demo_ecommerce/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(SplashScreen());
          },
          color: Color(0xffC5CCD6),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Login',
                color: Color(0xff323232),
                fontSize: defaultSize * 3.5,
              ),
              SizedBox(
                height: defaultSize * 6,
              ),
              CustomTextFormField(
                label: 'Email',
              ),
              SizedBox(
                height: defaultSize * 4.5,
              ),
              Consumer<AuthProvider>(builder: (_, authProvider, child) {
                return CustomTextFormField(
                  obscure: authProvider.isSignInPassVisible,
                  suffixIcon: authProvider.isSignInPassVisible
                      ? IconButton(
                          onPressed: () {
                            authProvider.changeSignInPassVisibility();
                          },
                          icon: Icon(Icons.visibility_off),
                          color: Color(kEyeVisibilityColor),
                        )
                      : IconButton(
                          onPressed: () {
                            authProvider.changeSignInPassVisibility();
                          },
                          icon: Icon(Icons.visibility),
                          color: Color(kEyeVisibilityColor),
                        ),
                  label: 'Password',
                );
              }),
              SizedBox(
                height: defaultSize * 2.5,
              ),
              CustomRoundedButton(
                onPressed: (){
                  Get.to(ControlScreen());
                },
                height: defaultSize * 4.5,
                color: Color(kButtonColor),
                width: double.infinity,
                child: CustomText(
                  'Log in',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: defaultSize * 2.5,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account ?  ',
                          style: TextStyle(
                              color: Color(kTextColor),
                              fontSize: defaultSize * 1.6),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: defaultSize * 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

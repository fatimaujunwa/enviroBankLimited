
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/routing/route_helper.dart';
import '../../widgets/sign_in_sign_out_screen_template.dart';
import '../loan /loan_form_screen.dart';





class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
   return SignInSignOutScreenTemplate(
     passwordController: password,
     emailController: email,
     accText: 'Don\'t have an account? ',
     signInSignOutText: 'Sign up',
     imgPath: 'images/Onboarding-cutout.png',
     blueContainerText: 'Sign in',
     text: 'Welcome back!',
     illustrationImgPath: 'images/amic.png',
     subText: 'Sign into your account',
     blueContainerFunction: () {
       print(email.text);
       print(password.text);

       validation.login(email, password);
     },
     signInOrSignUpFunction: () => Get.toNamed(RouteHelper.getSignup()),
    );
  }
}

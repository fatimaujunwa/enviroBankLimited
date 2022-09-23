
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/routing/route_helper.dart';
import '../../widgets/sign_in_sign_out_screen_template.dart';
import '../loan /loan_form_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    return
       SignInSignOutScreenTemplate(
         passwordController: password, emailController: email,
      illustrationImgPath: 'images/amico.png',
      imgPath: 'images/Onboarding-cutout.png',
      signInSignOutText: 'Sign in',
      accText: 'Already have an account? ',
      subText:'Let’s get you started with us' ,
      blueContainerText: 'Sign Up',
      text: 'Create an account', signInOrSignUpFunction: ()=>Get.toNamed(RouteHelper.getSignin()), blueContainerFunction: (){
        print(email.text);
        print(password.text);
         validation.signUp(email, password);
       },
    );
  }
}


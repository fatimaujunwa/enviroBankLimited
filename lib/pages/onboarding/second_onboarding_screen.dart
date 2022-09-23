
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/routing/route_helper.dart';
import '../../widgets/onboarding_screen_template.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreenTemplate(
      text: 'Minimal interest rates',
      illustrationImgPath:'images/onboarding illustration 2.png' ,
      subText: 'Get loans for a period of 12 months and\npayback with interest as low as 2%',
      nextSlide: false,
      logoHeight: 90.0.h,
      showSkip: '',
      blueContainerText: 'Get Started',
   blueContainerWidth: 150.w,
      next: ()=>Get.toNamed(RouteHelper.getSignin()),
      skip: (){},
    );
  }
}

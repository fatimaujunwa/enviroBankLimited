

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/routing/route_helper.dart';
import '../../widgets/onboarding_screen_template.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreenTemplate(
      text: 'Need money?',
      subText: 'Easily apply for loans and get granted',
      logoHeight: 118.1.h,
      illustrationImgPath: 'images/onboarding illustration 1.png',
      blueContainerText: 'Next',

      blueContainerWidth: 105.1.w,skip: (){}, next: ()=>Get.toNamed(RouteHelper.getSecondOnBoarding()),
    );
  }
}

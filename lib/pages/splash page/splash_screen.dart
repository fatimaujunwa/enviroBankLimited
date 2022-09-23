import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/routing/route_helper.dart';
import '../../utils/app_colors.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    Timer

      (const Duration(seconds: 4), ()=>Get.offNamed(RouteHelper.getFirstOnBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.darkBlue,
        child: Stack(
          children: [
            Positioned(
              top: 310.h,
              left: 123.w,
              right: 122.w,
              child: ScaleTransition(
                scale: animation,
                child: Container(
                  width: 169.w,
                  height: 110.h,
                  child: Image(image: AssetImage('images/app logo.png')),
                ),
              ),
            ),
            Positioned(
                top: 548.06.h,
                child: Container(
                  width: 414.0.w,
                  child: Image(
                    image: AssetImage('images/splash wave.png'),
                    fit: BoxFit.cover,
                  ),

                )),

          ],
        ),
      ),
    );
  }
}

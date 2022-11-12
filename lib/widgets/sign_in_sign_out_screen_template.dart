
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/user_controller.dart';
import '../utils/app_colors.dart';
import '../utils/text_dimensions.dart';
import 'blue_container.dart';
import 'custom_text_field.dart';
import 'google_container.dart';
import 'logo_container.dart';

class SignInSignOutScreenTemplate extends StatelessWidget {
  const SignInSignOutScreenTemplate(
      {Key? key,
      this.text = '',
      this.imgPath = '',
      this.subText = '',
      this.accText = '',
      this.signInSignOutText = '',
      this.illustrationImgPath = '',
      this.blueContainerText = '',
      required this.blueContainerFunction,
        required this.signInOrSignUpFunction,
        required this.emailController,
        required this.passwordController,

      })
      : super(key: key);
  final String imgPath;
  final String text;
  final String subText;
  final String accText;
  final String blueContainerText;
  final String illustrationImgPath;
  final String signInSignOutText;
  final Function() signInOrSignUpFunction;
  final Function() blueContainerFunction;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.whitePageBackground,
      body: Container(
height: 896.h,
        color: AppColors.whitePageBackground,
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              child: Container(
                child: Image(
                  image: AssetImage(imgPath),
                ),
              ),
            ),
            Positioned(
              top: 112.h,
              left: 131.w,
              child: Container(
                color: AppColors.whitePageBackground,
                height: 210.h,
                width: 250.h,
                child: Image(
                  image: AssetImage(illustrationImgPath),
                ),
              ),
            ),
            SingleChildScrollView(child: Column(children: [
              Stack(children: [

                Container(
                  width: 414.w,
                  child: Column(

                    children: [
                      SizedBox(height: 307.h,),
                      Container(
                        height: 554.0.h,
                        width: 414.w,
                        padding: EdgeInsets.only(left: 32.w, right: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                                  text,
                                  style: TextDimensions.style32InterW600Black,
                                )),
                            SizedBox(
                              height: 8.h,
                            ),
                            Center(
                                child: Text(
                                  subText,
                                  style: TextDimensions.style18InterW500Grey,
                                )),
                            SizedBox(
                              height: 36.h,
                            ),
                            Text(
                              'Email',
                              style: TextDimensions.style18InterW500Black,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
                              hintText: 'xxx@gmail.com',
                              height: 58.h,
                              width: 350.w,
                              controller: emailController, dateTime: () {  },


                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Password',
                              style: TextDimensions.style18InterW500Black,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextField(
                              hintText: '**********',
                              obsText: true,
                              suffixIcon: true,
                              height: 58.h,
                              width: 350.w,
                              controller: passwordController, dateTime: () {  },
                            ),
                            SizedBox(
                              height: 31.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                GetBuilder<UserController>(builder: (controller){
                                  return GestureDetector(
                                    onTap: blueContainerFunction,
                                    child: controller.isLoading==true? CircularProgressIndicator(color: AppColors.darkBlue,):BlueContainer(
                                      height: 53.h,
                                      width: 171.w,
                                      text: blueContainerText,
                                    ),
                                  );
                                })

                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  accText,
                                  style: TextDimensions.style16InterW500Grey,
                                ),
                                GestureDetector(
                                  onTap: signInOrSignUpFunction,
                                  child: Container(
                                    child: Text(
                                      signInSignOutText,
                                      style: TextDimensions.style16InterW500Blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            LogoContainer()
                          ],
                        ),
                      ),],

                  ),)
              ],)
            ],),)

            // Positioned(
            //   top: 358.h,
            //   left: 0,
            //   right: 0,
            //   child:
            //   Container(
            //     height: 554.h,
            //     width: 350.w,
            //     padding: EdgeInsets.only(left: 32.w, right: 32.w),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Center(
            //             child: Text(
            //           text,
            //           style: TextDimensions.style32InterW600Black,
            //         )),
            //         SizedBox(
            //           height: 8.h,
            //         ),
            //         Center(
            //             child: Text(
            //           subText,
            //           style: TextDimensions.style18InterW500Grey,
            //         )),
            //         SizedBox(
            //           height: 36.h,
            //         ),
            //         Text(
            //           'Email',
            //           style: TextDimensions.style18InterW500Black,
            //         ),
            //         SizedBox(
            //           height: 8.h,
            //         ),
            //         CustomTextField(
            //           hintText: 'xxx@gmail.com',
            //           height: 58.h,
            //           width: 350.w,
            //           controller: emailController,
            //
            //         ),
            //         SizedBox(
            //           height: 16.h,
            //         ),
            //         Text(
            //           'Password',
            //           style: TextDimensions.style18InterW500Black,
            //         ),
            //         SizedBox(
            //           height: 8.h,
            //         ),
            //         CustomTextField(
            //           hintText: '**********',
            //           obsText: true,
            //           suffixIcon: true,
            //           height: 58.h,
            //           width: 350.w,
            //           controller: passwordController,
            //         ),
            //         SizedBox(
            //           height: 31.h,
            //         ),
            //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //            googleSignIn,
            //             SizedBox(
            //               width: 8.w,
            //             ),
            //             GestureDetector(
            //               onTap: blueContainerFunction,
            //               child: BlueContainer(
            //                 height: 53.h,
            //                 width: 171.w,
            //                 text: blueContainerText,
            //               ),
            //             )
            //           ],
            //         ),
            //         SizedBox(
            //           height: 16.h,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               accText,
            //               style: TextDimensions.style16InterW500Grey,
            //             ),
            //             GestureDetector(
            //               onTap: signInOrSignUpFunction,
            //               child: Container(
            //                 child: Text(
            //                   signInSignOutText,
            //                   style: TextDimensions.style16InterW500Blue,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 40.h,
            //         ),
            //         LogoContainer()
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

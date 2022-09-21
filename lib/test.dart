
import 'package:envirobank/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'app_colors.dart';
import 'custom_dialogue_box.dart';

import 'custome_dialogue_box_two.dart';
import 'loan_form_screen.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
        child:
        Obx(()=> GestureDetector(
            onTap: (){
    CustomDialogue.showCustomDialog(context, okBtnFunction:(){},text: 'Your loan application has been denied'
    ,subText: 'This is due to the fact that your previous loan hasn’t been remitted.'
    );
            },
            child: Get.find<UserController>().googleLoading.value
                ? CircularProgressIndicator(
              color: AppColors.darkBlue,
            )
                : Container(
              color: Colors.red,
              height: 100,
              width: 100,
            )),)


      ),
    );
  }
}

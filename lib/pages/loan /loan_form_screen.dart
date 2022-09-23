
import 'package:envirobank/helper/logic/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/loan_controller.dart';
import '../../helper/routing/route_helper.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_dimensions.dart';
import '../../widgets/blue_container.dart';
import '../../widgets/custom_drop_down_menu.dart';
import '../../widgets/custom_text_field.dart';


Validation validation =Validation();
class LoanFormScreen extends StatelessWidget {
  const LoanFormScreen({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    TextEditingController fname = TextEditingController();
    TextEditingController lname = TextEditingController();
    TextEditingController bankName = TextEditingController();
    TextEditingController idNumber = TextEditingController();
    TextEditingController bankAccountNumber = TextEditingController();
    TextEditingController collectionDate = TextEditingController();

    TextEditingController loanAmount = TextEditingController();
    return Scaffold(

        body: Container(
          height: 896.h,
      child: Stack(
        children: [
          Positioned(
            right: -10.w,
            child: Container(

              child: Image(
                image: AssetImage('images/Form-cutout.png'),
              ),
            ),
          ),
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 105.h,
                    left: 32.w,
                    child:  Text(
                      'Apply for loan',
                      style: TextDimensions.style32InterW600Black,
                    ),),
                  Container(
                    child:
                    Column(
                      children: [

                        SizedBox(
                          height: 149.h,
                        ),

                        SizedBox(
                          height: 26.h,
                        ),
                        Container(
                          width: 414.w,
                          margin: EdgeInsets.only(left: 32.w, right: 32.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'First Name',
                                          style: TextDimensions.style18InterW500Black,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        CustomTextField(
                                          hintText: 'John',
                                          height: 52.h,
                                          width: 171.w,
                                          controller: fname,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Last Name',
                                          style: TextDimensions.style18InterW500Black,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        CustomTextField(
                                          hintText: 'Doe',
                                          height: 52.h,
                                          width: 171.w,
                                          controller: lname,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID Number',
                                    style: TextDimensions.style18InterW500Black,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomTextField(
                                    hintText: 'xxxxxxxxx',
                                    height: 52.h,
                                    width: 350.w,
                                    controller: idNumber,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bank Account',
                                    style: TextDimensions.style18InterW500Black,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomTextField(
                                    hintText: '1234567890',
                                    height: 52.h,
                                    width: 350.w,
                                    controller: bankAccountNumber,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomDropDown(
                                controller: bankName,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Collection Date',
                                    style: TextDimensions.style18InterW500Black,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomTextField(
                                    hintText: 'DD-MM-YY',
                                    height: 52.h,
                                    width: 350.w,
                                    controller: collectionDate,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Loan Amount(R)',
                                    style: TextDimensions.style18InterW500Black,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomTextField(
                                    hintText: '0.00',
                                    height: 52.h,
                                    width: 350.w,
                                    controller: loanAmount,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.toNamed(RouteHelper.getHomeScreen(userEmail));
                                    },
                                    child: Container(
                                      height: 52.h,
                                      width: 123.w,
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextDimensions.style18InterW500Black,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                        color: AppColors.textFieldColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                            GetBuilder<LoanController>(builder: (controller){
                             return

                            controller.isLoading?CircularProgressIndicator(color: AppColors.darkBlue,):   GestureDetector(
                              onTap: () {

                                validation.loanApplication(
                                  fname,
                                  lname,
                                  bankName,
                                  idNumber,
                                  bankAccountNumber,

                                  collectionDate,
                                  loanAmount,
                                  context,

                                );
                                print(fname.text);
                                print(lname.text);
                                print(bankName.text);
                                print(idNumber.text);
                                print(bankAccountNumber.text);
                                print(loanAmount.text);

                              },
                              child: BlueContainer(
                                height: 52.h,
                                width: 123.w,
                                text: 'Apply',
                              ),
                            );})

                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
        ],
      ),
    )


        );
  }
}

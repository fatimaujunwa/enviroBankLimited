import 'dart:convert';

import 'package:enviro_bank/custome_dialogue_box_two.dart';
import 'package:enviro_bank/loan_application_model.dart';
import 'package:enviro_bank/loan_model.dart';
import 'package:enviro_bank/route_helper.dart';
import 'package:enviro_bank/user_controller.dart';
import 'package:enviro_bank/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'custom_dialogue_box.dart';
import 'custom_snackbar.dart';
import 'loan_controller.dart';

class Validation {
  void login(TextEditingController email, TextEditingController password) {
    var userController = Get.find<UserController>();
    String emailController = email.text.trim();
    String passwordController = password.text.trim();
    if (emailController.isEmpty && passwordController.isEmpty) {
      showCustomSnackBar('Please type in your details', "user details");
    } else {
      if (emailController.isEmpty) {
        showCustomSnackBar('email field is required', 'Sign in message');
      } else if (passwordController.isEmpty) {
        showCustomSnackBar('password field is required', 'Sign in message');
      } else {
        if (!GetUtils.isEmail(emailController)) {
          showCustomSnackBar(
              'please input a valid email address', 'Sign in message');
        }

        if (password.text.length < 8) {
          showCustomSnackBar(
              'password length is short please input a longer password',
              'Sign in message');
        }
// if(RegExp(r'^').hasMatch(passwordController)){}
        //"user@email.co.za"
        //"*********"www
        else {
          email.clear();
          password.clear();
          User user =
              User(emailAddress: emailController, password: passwordController);

          userController.login(user).then((status) {
            print(userController.isLoading);
            if (status.jwt == null) {
              showCustomSnackBar(
                  'Invalid email and password combination! check that your internet is connected and try again',
                  'Sign in message');
            } else {
              print('token ' + status.jwt.toString());
              showCustomSnackBar('Logged in successfully! ', 'Sign in message');

              Get.toNamed(RouteHelper.getHomeScreen(emailController));
            }
          });
        }
      }
    }
  }

  void signUp(
    TextEditingController email,
    TextEditingController password,
  ) {
    var userController = Get.find<UserController>();
    String emailController = email.text.trim();
    String passwordController = password.text.trim();
    if (emailController.isEmpty && passwordController.isEmpty) {
      showCustomSnackBar('Please type in your details', "user details");
    } else {
      if (emailController.isEmpty) {
        showCustomSnackBar('email field is required', 'Sign up message');
      } else if (passwordController.isEmpty) {
        showCustomSnackBar('password field is required', 'Sign up message');
      } else {
        if (!GetUtils.isEmail(emailController)) {
          showCustomSnackBar(
              'please input a valid email address', 'Sign up message');
        }

        if (password.text.length < 8) {
          showCustomSnackBar(
              'password length is short please input a longer password',
              'Sign up message');
        }
// if(RegExp(r'^').hasMatch(passwordController)){}
        //"user@email.co.za"
        //"*********"www
        else {
          email.clear();
          password.clear();
          User user =
              User(emailAddress: emailController, password: passwordController);
          userController.register(user).then((status) {
            print(userController.isLoading);
            if (status.success == true) {
              showCustomSnackBar(
                  'Your account has been created successfully! Please Sign in',
                  'Sign up message');
              Get.toNamed(RouteHelper.getSignin());
            } else if (status.success == null) {
              print('success ' + status.success.toString());
              showCustomSnackBar(
                  'Unsuccessful attempt to create account please try again!',
                  'Sign up message');
            }
          });
        }
      }
    }
  }

  void loanApplication(
      TextEditingController fname,
      TextEditingController lname,
      TextEditingController bankName,
      TextEditingController idNumber,
      TextEditingController bankAccountNumber,
      TextEditingController collectionDate,
      TextEditingController loanAmount,
      BuildContext context) {
    {
      String fnameController = fname.text.trim();
      String lnameController = lname.text.trim();
      String bankNameController = bankName.text.trim();
      String idNumberController = idNumber.text.trim();
      String collectionDateController = collectionDate.text.trim();
      String bankAccountNumberController = bankAccountNumber.text.trim();
      String loanAmountController = loanAmount.text.trim();

      var loanController = Get.find<LoanController>();
      if (fnameController.isEmpty &&
          lnameController.isEmpty &&
          bankNameController.isEmpty &&
          idNumberController.isEmpty &&
          collectionDateController.isEmpty &&
          bankAccountNumberController.isEmpty &&
          loanAmountController.isEmpty) {
        showCustomSnackBar('Please type in your details', "loan details");
      } else {
        if (fnameController.isEmpty) {
          showCustomSnackBar('First Name field is required', 'Sign up message');
        } else if (lnameController.isEmpty) {
          showCustomSnackBar('Last Name field is required', 'Sign up message');
        } else if (idNumberController.isEmpty) {
          showCustomSnackBar('ID Number field is required', 'Sign up message');
        } else if (bankAccountNumberController.isEmpty) {
          showCustomSnackBar(
              'Bank Account Number field is required', 'Sign up message');
        } else if (bankNameController.isEmpty) {
          showCustomSnackBar('Bank Name field is required', 'Sign up message');
        } else if (collectionDateController.isEmpty) {
          showCustomSnackBar(
              'Collection Date field is required', 'Sign up message');
        } else if (loanAmountController.isEmpty) {
          showCustomSnackBar(
              'Loan Amount field is required', 'Sign up message');
        } else {
          Loan loanApplication = Loan(
              amount: loanAmountController,
              bankAccount: BankAccount(
                  accountNumber: bankAccountNumberController,
                  bankName: bankNameController,
                  branchCode: '250060'),
              collectionDate: collectionDateController,
              firstName: fnameController,
              idNumber: idNumberController,
              lastName: lnameController);

          if (bankNameController == 'VBS') {
            DialogUtils.showCustomDialog(context,
                okBtnFunction: () {},
                text: 'Refer to Compliance',
                approved: false);
          } else {
            loanController.loanApplication(loanApplication).then((status) {

              if (status.approved == true) {
                Navigator.pop(context);
                Get.find<LoanController>()
                    .addToLoanItems(status.reference!, loanAmountController);
                Get.find<LoanController>().addToLoanHistory();

                Get.find<LoanController>().setOutstandingLoans();
                Get.find<LoanController>().getOutstandingLoan();

                DialogUtils.showCustomDialog(context,
                    okBtnFunction: () {},
                    text:
                        'Congratulations ${fnameController.toUpperCase()} ${lnameController.toUpperCase()}',
                            subText: 'Your Loan for R${loanAmountController.toUpperCase()} has been approved!');
              } else if (status.approved == false) {
                DialogUtils.showCustomDialog(context,
                    okBtnFunction: () {},
                    text:
                        'Your loan application for R${loanAmountController.toUpperCase()} has been denied.'
                           ,
                    approved: false,subText:'${status.errors!.join().toUpperCase()}, please try again');
              }

            });
          }
        }
      }
    }
  }
}

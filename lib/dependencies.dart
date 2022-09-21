

import 'package:enviro_bank/user_controller.dart';
import 'package:enviro_bank/user_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'app_constants.dart';

import 'loan_controller.dart';
import 'loan_repo.dart';

Future<void>init(
    )async{
  //shared preferences
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);


 //apiClient
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppVariables.BASE_URI));

  //repositories
  Get.lazyPut(() => UserRepo(apiClient: Get.find(),sharedPreferences:Get.find()));
  Get.lazyPut(() => LoanRepo(apiClient: Get.find(),sharedPreferences:Get.find() ));

  //controllers
  Get.lazyPut(() => UserController( userRepo: Get.find()));
  Get.lazyPut(() => LoanController( loanRepo: Get.find()));



}
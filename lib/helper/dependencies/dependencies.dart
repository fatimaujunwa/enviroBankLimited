



import 'package:envirobank/controllers/date_picker_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/loan_controller.dart';
import '../../controllers/user_controller.dart';
import '../../data/api/api_client.dart';
import '../../data/repository/loan_repo.dart';
import '../../data/repository/user_repo.dart';
import '../../utils/app_constants.dart';

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
  Get.lazyPut(() => DatePickerController());




}
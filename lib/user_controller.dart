import 'dart:convert';

import 'package:enviro_bank/token_model.dart';
import 'package:enviro_bank/user_model.dart';
import 'package:enviro_bank/user_repo.dart';
import 'package:enviro_bank/validation_response_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//UserController acts as the interface between UserRepo and the Screens
class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});
bool _isLoading=false;
var googleLoading=false.obs;


bool get isLoading=>_isLoading;
//returns the response body, sends it to the validation response model and returns it
  Future<ValidationResponse> register(User userModel) async {
    _isLoading=true;
    Response response = await userRepo.register(userModel);
    late ValidationResponse responseModel;
    if (response.statusCode == 200) {
_isLoading=false;
update();
      return responseModel =
          ValidationResponse([], response.body['success'], []);

    } else {
      _isLoading=false;
      update();



      return responseModel =ValidationResponse([], null, []);
    }
  }
//returns the token 'jwt' which is saved in the apiClient header
  Future<Token> login(User userModel) async {
_isLoading=true;
update();
print('before'+_isLoading.toString());
// await Future.delayed(Duration(seconds: 3));
    Response response = await userRepo.login(userModel);
    late Token tokenModel;
    if (response.statusCode == 200) {
      _isLoading=false;
      update();
      print('after'+_isLoading.toString());

       userRepo.saveUserToken(response.body["jwt"]);

     return   Token(jwt:response.body["jwt"] );;

    } else {
      print(response.statusCode);
      _isLoading=false;
update();
      return  Token(jwt:null);
    }
  }
 void loadingGoogleSignIn() async {
    googleLoading.value=true;
    print('before '+googleLoading.toString());

    await Future.delayed(Duration(seconds: 3));
    print('done');
    googleLoading.value=false;
    print('after '+googleLoading.toString());

  }
}

import 'package:envirobank/user_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'app_constants.dart';

class UserRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  UserRepo({required this.apiClient,required this.sharedPreferences});

  Future<Response>register(User userModel)async{
    return await apiClient.postData(AppVariables.REGISTER_URI, userModel.toJson() );
  }
  Future<Response>login(User userModel)async{
    return await apiClient.postData(AppVariables.LOGIN_URI, userModel.toJson());
  }
  saveUserToken(String token) async {
apiClient.token=token;
apiClient.updateHeaders(token);
return await sharedPreferences.setString(AppVariables.TOKEN, token);
  }
}

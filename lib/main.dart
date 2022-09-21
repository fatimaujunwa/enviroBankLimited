
import 'package:enviro_bank/first_onboarding_screen.dart';
import 'package:enviro_bank/home_screen.dart';
import 'package:enviro_bank/loan_controller.dart';
import 'package:enviro_bank/loan_form_screen.dart';
import 'package:enviro_bank/onboarding_screen_template.dart';
import 'package:enviro_bank/route_helper.dart';
import 'package:enviro_bank/second_onboarding_screen.dart';
import 'package:enviro_bank/sign_in_screen.dart';
import 'package:enviro_bank/sign_in_sign_out_screen_template.dart';
import 'package:enviro_bank/sign_up_screen.dart';
import 'package:enviro_bank/splash_screen.dart';
import 'package:enviro_bank/tab_bar_widget.dart';
import 'package:enviro_bank/test.dart';
import 'package:enviro_bank/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:enviro_bank/dependencies.dart' as dep;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart'
;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<LoanController>().getLoanHistory();
    Get.find<LoanController>().getRemitHistory();
    Get.find<LoanController>().setOutstandingLoans();
    Get.find<LoanController>().getOutstandingLoan();

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  return ScreenUtilInit(builder: (context,_){
    return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'enviroBank ltd',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(userEmail: '',)
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  },
  designSize: Size(416, 896),


  );


  }
}


//

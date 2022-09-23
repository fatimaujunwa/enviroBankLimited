
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../pages/authentication/sign_in_screen.dart';
import '../../pages/authentication/sign_up_screen.dart';
import '../../pages/home/home_screen.dart';
import '../../pages/loan /loan_form_screen.dart';
import '../../pages/onboarding/first_onboarding_screen.dart';
import '../../pages/onboarding/second_onboarding_screen.dart';
import '../../pages/splash page/splash_screen.dart';

class RouteHelper{
  static const String initial="/";
  static const String signUp="/sign-up";
  static const String signIn="/sign-in";
  static const String firstOnBoarding="/first-onboarding-screen";
  static const String secondOnBoarding="/second-onboarding-screen";
  static const String homeScreen="/home-screen";
  static const String test="/test";
  static const String applyLoan="/apply-loan";

  static const String cartPage="/cart-page";
  static const String orderToCart="/orders-cart";
  static const String proceed="/proceed";

  static const String favoritePage="/favorite-page";
  static const String orderDetails="/order-details";
  static const String logout="/logout";
  static const String profile="/profile";
  static const String foodScreen="/food-screen";
  static const String itemsScreen="/items-screen";
  static const String orderid="/order-id";
  static  String getSignin()=>'$signIn';
  static  String getSignup()=>'$signUp';
  static  String getInitial()=>'$initial';
  static  String getFirstOnBoarding()=>'$firstOnBoarding';
  static  String getSecondOnBoarding()=>'$secondOnBoarding';
  static  String getHomeScreen(String userEmail)=>'$homeScreen?userEmail=$userEmail';
  static  String getApplyLoan(String userEmail)=>'$applyLoan?userEmail=$userEmail';

  static  String getItems(int itemsId)=>'$itemsScreen?itemsId=$itemsId';
  static  String getTestPage()=>'$test';
  static  String getOrderToCart()=>'$orderToCart';
  static  String getProceed()=>'$proceed';

  static  String getFavorite()=>'$favoritePage';

  static  String getOrdersDetails()=>'$orderDetails';
  static  String getProceedPage()=>'$proceed';
  static  String getLogOut()=>'$logout';
  static  String getProfile()=>'$profile';
  static  String getFoodScreen()=>'$foodScreen';


  static List<GetPage> routes=[
    // GetPage(name: initial, page: ()=>MainFoodPage()),
    // GetPage(name: popularFood, page: ()=>PopularFoodDetail()),
    GetPage(name: initial, page: (){
      return LogoScreen();
    },

transitionDuration:Duration(seconds: 1)

    ),
    GetPage(name: homeScreen, page: (){
      var userEmail=Get.parameters['userEmail'];
      return HomeScreen(userEmail:userEmail! ,);
    },
        transitionDuration:Duration(seconds: 1)


    ),

    // GetPage(name: homeScreen, page: (){
    //
    //
    //   return HomeScreen();
    // },
    //
    //     transitionDuration: Duration(seconds: 1)
    //
    // ),



    GetPage(name: applyLoan, page: (){
      var userEmail=Get.parameters['userEmail'];
      return LoanFormScreen(userEmail:userEmail! );
    },
        transitionDuration:Duration(seconds: 1)


    ),
    //
    // GetPage(name:test, page: (){
    //   return Test();
    // },
    //     transitionDuration:Duration(seconds: 1)
    //
    //
    // ),
    //
    //
    GetPage(name: firstOnBoarding, page: (){
      return FirstOnBoardingScreen();
    },
        transitionDuration:Duration(seconds: 1)


    ),
    //

    //
    GetPage(name: secondOnBoarding, page: (){

      return SecondOnBoardingScreen();
    },


        transitionDuration:Duration(seconds: 1)
    ),
    //
    // GetPage(name: homeScreen, page: (){
    //   return HomeScreen();
    //
    // },
    //     transitionDuration:Duration(seconds: 1)
    //
    //
    // ),
    //
    // GetPage(name: favoritePage, page: (){
    //
    //   return FavoritesPage();
    // },
    //     transition: Transition.leftToRightWithFade
    // ),
    //
    // GetPage(name: profile, page: (){
    //   var pageId=Get.parameters['pageId'];
    //   return ProfileScreen();
    // },
    //
    //     transition: Transition.rightToLeftWithFade
    // ),
    GetPage(name: signIn, page: (){

      return SignInScreen();
    },

  transitionDuration:Duration(seconds: 1)

  ),

    GetPage(name: signUp, page: (){

      return SignUpScreen();
    },

  transitionDuration:Duration(seconds: 1)

  )
  ];
}
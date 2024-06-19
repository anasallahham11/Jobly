import 'package:flutter/material.dart';
import 'package:jobly/modules/community/community_view.dart';
import 'package:jobly/modules/community/question/question_view.dart';
import 'package:jobly/modules/core/onboarding/onboarding_view.dart';
import 'package:jobly/resources/strings_manager.dart';

import '../modules/core/splash/splash_view.dart';


class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";

  static const String communityRoute = "/community";
  static const String questionRoute = "/question";



}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> OnboardingView());
      case Routes.communityRoute:
        return MaterialPageRoute(builder: (_)=> CommunityView());
      case Routes.questionRoute:
        return MaterialPageRoute(builder: (_)=> QuestionView());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
    Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    )
    );
  }
}
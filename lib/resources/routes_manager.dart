import 'package:flutter/material.dart';
import 'package:jobly/resources/strings_manager.dart';


class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";



}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.splashRoute:
        //return MaterialPageRoute(builder: (_)=>const SplashView());
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
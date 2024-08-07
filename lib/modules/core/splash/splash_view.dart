import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobly/modules/home/home_layout_view.dart';


import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/routes_manager.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay(){
    _timer=Timer(const Duration(seconds: AppConstants.splashDelay),_goNext);
  }
  _goNext() {
   // Navigator.pushReplacementNamed(context, Routes.homeRoute);

    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.purple5,
      body: const Center(child: Image(image: AssetImage(ImageAssets.whiteLogo))),
    );
  }

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
}

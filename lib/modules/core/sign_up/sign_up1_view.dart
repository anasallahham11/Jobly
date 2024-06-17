import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class SignUpPage1 extends StatefulWidget {
  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  String _companyText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.purple6,
              ColorManager.purple5,
              ColorManager.purple4,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppSize.s100,),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        child: Container(
                          width: 300, // العرض
                          height: 500, // الطول
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(image: AssetImage(ImageAssets.purpleLogo)),
                              SizedBox(height: AppSize.s16),
                              const Text(
                                AppStrings.titlel,
                                style: TextStyle(
                                  fontSize: AppSize.s16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Divider(),
                              SizedBox(height: AppSize.s12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.purple6,
                                    onPressed: () {
                                      setState(() {
                                        _companyText = "if you want to creat company acount viste our website";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        const Icon(Icons.home_work_rounded, size: AppSize.s40,),
                                        Expanded(
                                          child: const Text(
                                            "COMPANY",
                                            style: TextStyle(
                                              fontSize: AppSize.s8,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s18,),
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.purple6,
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        const Icon(Icons.work_outline_rounded, size: AppSize.s40,),
                                        Expanded(
                                          child: const Text(
                                            "EMPLOYEE",
                                            style: TextStyle(
                                              fontSize: AppSize.s8,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              if (_companyText.isNotEmpty) // عرض النص عند وجوده
                                Text(
                                  _companyText,
                                  style: TextStyle(
                                    fontSize: AppSize.s12,
                                    fontStyle: FontStyle.italic,
                                    color: ColorManager.purple6,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -40,
                        left: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorManager.purple6, // لون البوردير الشفاف
                              width: 5.0, // عرض البوردير
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: ColorManager.white,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: ColorManager.purple6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

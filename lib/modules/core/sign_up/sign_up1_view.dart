import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobly/modules/core/sign_up/sign_up2_view.dart';
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
                              const Image(image: AssetImage(ImageAssets.purpleLogo)),
                              const SizedBox(height: AppSize.s16),
                              const Divider(),
                              const SizedBox(height: AppSize.s12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.purple6,
                                    onPressed: () {
                                      setState(() {
                                        _companyText = AppStrings.companySignup;
                                      });
                                    },
                                    child: const Column(
                                      children: [
                                        Icon(Icons.home_work_rounded, size: AppSize.s40,),
                                        Expanded(
                                          child: Text(
                                            AppStrings.company,
                                            style: TextStyle(
                                              fontSize: AppSize.s8,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.s18,),
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.purple6,
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SingupEmployee()));
                                    },
                                    child: const Column(
                                      children: [
                                        Icon(Icons.work_outline_rounded, size: AppSize.s40,),
                                        Expanded(
                                          child: Text(
                                            AppStrings.employee,
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
                              const SizedBox(height: AppSize.s16),
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
                              size: AppSize.s40,
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

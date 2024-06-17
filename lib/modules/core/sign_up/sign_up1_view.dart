import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/login/cubit/cubit.dart';
import 'package:jobly/modules/core/login/cubit/states.dart';
import 'package:jobly/modules/core/sign_up/cubit/cubit.dart';
import 'package:jobly/modules/core/sign_up/cubit/states.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/widgets.dart';


class SignUpPage1 extends StatelessWidget {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocListener<SignUpCubit, SignupStates>(
          listener: (context, state) {
            if (state is SignupErorrStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('SignUp Failed: ${state.erorr}'),
                ),
              );
            } else if (state is LoginSuccessStates) {
              // Navigate to another screen
             // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(230, 85, 0, 121),
                  Color.fromARGB(230, 181, 47, 239),
                  Color.fromARGB(255, 142, 45, 226),
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
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                Image(image: AssetImage(ImageAssets.splashLogo)),
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
                                    backgroundColor: Colors.purple,
                                    onPressed: (){},
                                  child: Column(
                                    children: [
                                      const Icon(Icons.home_work_rounded,size: AppSize.s40,),
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
                                  ),),
                                  


                                  SizedBox(
                                    width: AppSize.s18,
                                  ),

                                   FloatingActionButton(
                                    backgroundColor: Colors.purple,
                                    onPressed: (){},
                                   child: Column(
                                     children: [
                                   
                                       const Icon(Icons.work_outline_rounded,size: AppSize.s40,),
                                   
                                                Expanded(
                                                  child: const Text(
                                                             "EMPLOYEE",
                                                               style: TextStyle(
                                                               fontSize: AppSize.s8,
                                                                fontStyle: FontStyle.italic,
                                                              ),
                                                              ),
                                                )
                                   
                                     ],
                                   ),),
                                    ],

                                    
                                  )
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
                                color: Colors.purple, // لون البوردير الشفاف
                                width: 5.0, // عرض البوردير
                              ),
                            ),
                            child:const CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.purple,
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
        ),
      ),
    );
  }
}

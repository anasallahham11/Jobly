import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/login/cubit/cubit.dart';
import 'package:jobly/modules/core/login/cubit/states.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/widgets.dart';
import '../sign_up/sign_up1_view.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginErorrStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login Failed: ${state.erorr}'),
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
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromARGB(230, 85, 0, 121),
                  // Color.fromARGB(230, 181, 47, 239),
                  // Color.fromARGB(255, 142, 45, 226),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                      
                                const Image(image: AssetImage(ImageAssets.purpleLogo)),
                                const SizedBox(height: AppSize.s16),
                              
                               
                                  const Text(
                                    AppStrings.titlel,
                                    style: TextStyle(
                                      fontSize: AppSize.s16,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: AppSize.s32),
                                  textFieldComponant(  _mobileNumberController,AppStrings.emaill,const OutlineInputBorder(),false),
                                  const SizedBox(height: AppSize.s16),
                                  textFieldComponant( _passwordController,AppStrings.Password,const OutlineInputBorder(),true),
                                 const  SizedBox(height: 16),
                                  BlocBuilder<LoginCubit, LoginStates>(
                                    builder: (context, state) {
                                      if (state is LoginLoadingStates) {
                                        return const CircularProgressIndicator();
                                      }
                              
                                      return ElevatedButton(
                                        onPressed: () {
                                          final email = _mobileNumberController.text;
                                          final password = _passwordController.text;
                                          BlocProvider.of<LoginCubit>(context).userLogin(email: email, password: password);
                                        },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorManager.white, // Set the button's background color to white
                                          )      ,
                                        child:  Text(AppStrings.SIGNIN,style: TextStyle(color:ColorManager.purple6,),),
                                      );
                                    },
                                  ),
                                  const Divider(),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignUpPage1()));
                                      
                                      // Handle register
                                    },
                                    child:  Text(AppStrings.account,style: TextStyle(color: ColorManager.purple6,),),
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
        ),
      ),
    );
  }
}

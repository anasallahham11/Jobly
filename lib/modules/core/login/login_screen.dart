import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/login/cubit/cubit.dart';
import 'package:jobly/modules/core/login/cubit/states.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/anas_widgets.dart';
import '../../home/home_layout_view.dart';
import '../sign_up/sign_up_user/singup_user_view.dart';



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
                 SnackBar(
                  content: Text('Login sucssec'),
                );
              // Navigate to another screen
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeLayoutView()));
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  BoxDecoration(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                      
                                const Image(image: AssetImage(ImageAssets.purpleLogo)),
                                const SizedBox(height: AppSize.s16),
    
                                  defaultFormField(controller: _mobileNumberController, type:TextInputType.emailAddress, label: AppStrings.emaill,prefix: Icons.email),
                                  const SizedBox(height: AppSize.s16),
                                  defaultFormField(controller: _passwordController, type:TextInputType.text, label: AppStrings.password,isPassword: true,prefix: Icons.password),
                                  const SizedBox(height: AppSize.s16),
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
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SingupUser()));
                                      
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

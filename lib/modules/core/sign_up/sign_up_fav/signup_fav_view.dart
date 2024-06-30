




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/sign_up/sign_up_fav/cubit/cubit.dart';
import 'package:jobly/modules/core/sign_up/sign_up_fav/cubit/states.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../home/home_layout_view.dart';

class SingupSubCat extends StatelessWidget {
 var idfav;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.purple6,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: ()
            {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeLayoutView()),);

            },
           child: Text(AppStrings.skip,style:getBoldStyle(color: ColorManager.white,fontSize: FontSize.s20) )
           ),
           
        ],
      ),
     
      body: BlocProvider(
        create: (context) => SignUpFavCubit(),
        child: BlocListener<SignUpFavCubit, SignupFavStates>(
          listener: (context, state) {
            if (state is SignupFavErorrStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('signup Failed: ${state.erorr}'),
                ),
              );
            } else if (state is SignupFavSuccessStates) {
                 SnackBar(
                  content: Text('signup sucssec'),
                );
              // Navigate to another screen
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SingupSkill()));
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

                                 const  SizedBox(height: 16),
                                  BlocBuilder<SignUpFavCubit, SignupFavStates>(
                                    builder: (context, state) {
                                      if (state is SignupFavLoadingStates) {
                                        return const CircularProgressIndicator();
                                      }
                              
                                      return ElevatedButton(
                                        onPressed: () {

                                          final id = idfav;
                                          BlocProvider.of<SignUpFavCubit>(context).FavSignUp(favid:id );
                                        },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorManager.white, // Set the button's background color to white
                                          )      ,
                                        child:  Text(AppStrings.next,style: TextStyle(color:ColorManager.purple6,),),
                                      );
                                    },
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

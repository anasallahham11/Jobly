  import 'package:flutter/material.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

//onboarding
class BoardingModle{
  final String image;
  final String title;
  final String body;
  BoardingModle({
    required this.body,
    required this.title,
    required this.image,

  });
} 

Widget BulidBoardingItem(BoardingModle modle)=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(child: Image(image:AssetImage('${modle.image}'))),
          const SizedBox(height: 30,),
          Text('${modle.title}',style: getBoldStyle(color: Colors.black,fontSize: FontSize.s22),),
           const SizedBox(height: 15,),
          Text('${modle.body}',style:getRegularStyle(color: Colors.black,fontSize:FontSize.s14),),
          const   SizedBox(height: 15,),
        ],
      );


//text from feld

Widget TextFieldComponant(TextEditingController _passwordController, String AppStrings,InputBorder? border,bool obscureText){
                   return TextField(
                     controller: _passwordController,
                       decoration: InputDecoration(
                         labelText: AppStrings,
                           border:border,
                              ),
                           obscureText: obscureText,
                                  );
}


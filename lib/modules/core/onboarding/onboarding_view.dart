


import 'package:flutter/material.dart';
import 'package:jobly/modules/core/sign_up/sign_up_employy/signup_employy_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../widgets/widgets.dart';
import '../login/login_screen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  
  @override
  State<OnboardingView> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingView> {
      var boardcontroller =PageController();

      List<BoardingModle> boarding =[
        BoardingModle(
             body: AppStrings.body1 ,
             title: AppStrings.title1,
             image: ImageAssets.onboarding1
          ),
        BoardingModle(
             body:AppStrings.body2 ,
             title: AppStrings.title2,
             image: ImageAssets.onboarding2
          ),
        BoardingModle(
             body:AppStrings.body3 ,
             title: AppStrings.title3,
             image: ImageAssets.onboarding3
          )
      ];

      bool islast =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: ()
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()),);

            },
           child: Text(AppStrings.skip,style:getBoldStyle(color: Colors.purple,fontSize: FontSize.s20) )
           ),
           
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
              physics:  const BouncingScrollPhysics(),
              controller: boardcontroller,
              onPageChanged: (int index){
                if(index == boarding.length-1){

                  setState(() {
                    islast=true;
                  });
                  
                }else{
                  setState(() {
                    islast =false;
                  });
                }
              },
              itemBuilder:(context,index)=> bulidBoardingItem(boarding[index]),
              itemCount: boarding.length ,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
             Row(children: [
             SmoothPageIndicator(
              controller: boardcontroller, 
              effect:  const ExpandingDotsEffect(
                activeDotColor: Colors.purple, 
                dotColor: Colors.grey,
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5.0

              ),
              count: boarding.length,
              ),
             const Spacer(),
              FloatingActionButton(
                backgroundColor: Colors.purple,
                onPressed: 
                ()
                {
                  if(islast)
                  {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()),);
                  }
                  boardcontroller.nextPage(
                    duration: const Duration(
                      milliseconds: 1000,
                    ),
                     curve: Curves.fastLinearToSlowEaseIn
                     
                     );

                },
                child: const Icon(Icons.arrow_forward_ios),)
            ],)
          ],
        ),
      )
    );
  }


}
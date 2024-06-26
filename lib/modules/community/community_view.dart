
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/font_manager.dart';
import 'package:jobly/resources/style_manager.dart';
import 'package:jobly/resources/values_manager.dart';

import '../../widgets/anas_widgets.dart';
import '../../widgets/widgets.dart';
import 'cubit/community_cubit.dart';
import 'cubit/community_states.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});
  @override
  Widget build(BuildContext context) {
    //var commentController = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) => CommunityCubit(),
        child: BlocConsumer<CommunityCubit, CommunityStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = CommunityCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  elevation: AppSize.s0,
                  backgroundColor: ColorManager.white,
                  title: Text('Community',style: getMediumStyle(color: ColorManager.darkPrimary).copyWith(fontSize: FontSize.s22),),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p14),
                      child: Image.asset(ImageAssets.trendingIc,width: AppSize.s20,height: AppSize.s16,),
                    ),
                  ],
                ),
                backgroundColor: ColorManager.offWhite,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const SizedBox(height: AppSize.s14,),
                    SizedBox(
                      height: AppSize.s50,
                      width: AppSize.s350,
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=> GestureDetector(
                          onTap: (){
                            cubit.changeTabBar(index);
                            //cubit.getQuestions();
                          },
                          child: animatedTabBarItem(cubit, index, AppSize.s2, AppSize.s165, ColorManager.purple6),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s16,),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            buildAdviceItem(null, context, cubit, state),
                            const SizedBox(height: 20),
                            buildAdviceItem(null, context, cubit, state),
                            const SizedBox(height: 20),
                            buildAdviceItem(null, context, cubit, state),
                            const SizedBox(height: 20),
                            buildAdviceItem(null, context, cubit, state),
                            const SizedBox(height: 20),
                            buildAdviceItem(null, context, cubit, state)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ));

  }}

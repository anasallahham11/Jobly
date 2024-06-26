
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/font_manager.dart';
import 'package:jobly/resources/style_manager.dart';
import 'package:jobly/resources/values_manager.dart';

import '../../../widgets/anas_widgets.dart';
import 'cubit/question_cubit.dart';
import 'cubit/question_states.dart';



class QuestionView extends StatelessWidget {
  const QuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    var answerController = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) => QuestionCubit(),
        child: BlocConsumer<QuestionCubit, QuestionStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = QuestionCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  elevation: AppSize.s0,
                  backgroundColor: ColorManager.white,
                  title: Text('Question',style: getMediumStyle(color: ColorManager.darkPrimary).copyWith(fontSize: FontSize.s22),),
                ),
                backgroundColor: ColorManager.offWhite,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const SizedBox(height: AppSize.s14,),
                    buildDetailedQuestionItem(null, context, cubit, state),
                    //const SizedBox(height: AppSize.s16,),
                    Padding(
                      padding: const EdgeInsets.all( 20.0),
                      child: defaultFormField(
                          controller: answerController,
                          type: TextInputType.text,
                          label: "Add Answer",
                          suffix: Icons.add,
                          prefix: Icons.mode_comment_rounded
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                      child: Row(
                        children: [
                          Image.asset(ImageAssets.trendingIc,width: AppSize.s20,height: AppSize.s20,),
                          Text("Top Answers:",style: getSemiBoldStyle(color: ColorManager.grey).copyWith(fontSize: FontSize.s18),),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s5,),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            buildAnswerItem(null, context, cubit, state),
                            SizedBox(height: 20,),
                            buildAnswerItem(null, context, cubit, state),
                            SizedBox(height: 20,),
                            buildAnswerItem(null, context, cubit, state),
                            SizedBox(height: 20,),
                            buildAnswerItem(null, context, cubit, state),
                            SizedBox(height: 20,),

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

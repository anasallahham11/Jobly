import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:jobly/modules/community/question/question_view.dart';
import 'package:jobly/modules/regular/search/cubit/search_cubit.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/values_manager.dart';
import 'package:jobly/utils/constants.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import '../modules/announcements/cubit/announcements_states.dart';
import '../modules/applications/cubit/applications_states.dart';
import '../modules/community/cubit/community_states.dart';
import '../modules/community/question/cubit/question_states.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

///Tools
Widget multiSelectionWidget({
  required items,
  required title,
  required icon,
  required buttonText,
  required result
})=>Padding(
  padding: const EdgeInsets.all(AppPadding.p8),
  child:   MultiSelectDialogField(
    items: items,
    dialogWidth: AppSize.s30,
    title: Text(title),
    selectedColor: ColorManager.darkPrimary,
    decoration: BoxDecoration(
      color: null,
      borderRadius:
      const BorderRadius.all(Radius.circular(AppSize.s40)),
      border: Border.all(
        color: ColorManager.primary,
        width: AppSize.s1_5,
      ),
    ),
    buttonIcon: Icon(
      icon,
      color: ColorManager.primary,
    ),
    buttonText: Text(
      buttonText,
      style: TextStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
    ),
    onConfirm: (chosen) {
      if(result==SearchCubit.selectedCities) {
        SearchCubit.selectedCities = chosen;
      }else if(result==SearchCubit.selectedTypes) {
        SearchCubit.selectedTypes = chosen;
      }else if(result==SearchCubit.selectedCategories) {
        SearchCubit.selectedCategories = chosen;
      } else if(result==SearchCubit.selectedSections) {
        SearchCubit.selectedSections = chosen;
      } else {
        result = chosen;
      }
    },
  ),
);

Widget highlightedContainer(color, radius, text)=>Container(
  padding: const EdgeInsets.symmetric(horizontal: AppSize.s10, vertical: AppSize.s5),
  decoration: BoxDecoration(
    color: color.withOpacity(0.3),
    borderRadius:  BorderRadius.only(
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    ),
  ),
  child: Text(
    text,
    style: getSemiBoldStyle(color: color,fontSize: FontSize.s14),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
  FormFieldValidator? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
            color: ColorManager.purple3,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffix),
                  color: ColorManager.purple6,
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ColorManager.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ColorManager.purple5),
          ),
        ));

Future<void> addingDialog(cubit,context,{required title,required controller,required onPressed}){
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          child: defaultFormField(
              type: TextInputType.text,
              label: 'type here',
              controller: controller
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}

///COMMUNITY
Widget animatedTabBarItem(cubit, index, height, width, color,) => AnimatedContainer(
      duration: const Duration(milliseconds: DurationConstant.d100),
      margin: const EdgeInsets.all(AppMargin.m5),
      width: AppSize.s165,
      height: AppSize.s2,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color with opacity
              offset: const Offset(2, 20), // Position of the shadow
              blurRadius: AppSize.s50, // Blur effect of the shadow
              spreadRadius: AppSize.s10, // Spread radius of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s20),
          border: Border.all(color: ColorManager.white, width: AppSize.s1_5),
          color: cubit.currentIndex == index ? color : ColorManager.white),
      child: Center(
        child: Text(
          cubit.type[index],
          style: TextStyle(
              color: cubit.currentIndex == index
                  ? ColorManager.white
                  : ColorManager.darkPrimary),
        ),
      ),
    );

Widget buildAnswerItem(answer,question, context, cubit, state,) => Card(
      color: ColorManager.purple0,
      shadowColor: ColorManager.purple0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppSize.s28), // Change the radius here
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: AppSize.s18,
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s20,
                  backgroundColor: ColorManager.white,
                  backgroundImage: imageSelector(image: answer.image,defaultImage: ImageAssets.employeeIc),
                ),
                const SizedBox(
                  width: AppSize.s14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${answer.name}',
                            style: const TextStyle(height: AppSize.s1_5),
                          ),
                          const SizedBox(
                            width: AppSize.s8,
                          ),
                          answer.isAuth ?
                               const Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                  size: AppSize.s16,
                                )
                              : const SizedBox(
                                  width: AppSize.s1_5,
                                ),
                        ],
                      ),
                      Text(
                          '${answer.time}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: AppSize.s1_5)),
                    ],
                  ),
                ),
                answer.isMine==true?
                InkWell(
                  onTap: (){
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(''),
                          content: SizedBox(
                              width: 40,
                              height: 80,
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  InkWell(
                                      onTap:(){
                                        var editedAnswerController = TextEditingController(text: '${answer.content}');
                                        addingDialog(
                                          cubit,
                                          context,
                                          title: 'Edit Answer',
                                          controller: editedAnswerController,
                                          onPressed: () {
                                            cubit.editAnswer(
                                                answerId : answer.id,
                                                content : editedAnswerController.text,
                                                token : token
                                            );
                                            cubit.getAnswers(question.id);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      },
                                      child: Text('Edit Answer',style: TextStyle(color: ColorManager.pending),)),
                                  const SizedBox(height: 20,),
                                  InkWell(
                                      onTap:(){
                                        showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Are You Sure'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Delete'),
                                                  onPressed: () {
                                                    cubit.deleteAnswer(answer.id);
                                                    cubit.getAnswers(question.id);
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Delete Answer',style: TextStyle(color: ColorManager.error))),
                                ],
                              )
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        ImageAssets.dotsIc
                    ),
                  ),
                ):
                InkWell(
                  onTap: (){
                    var reportController = TextEditingController();
                    addingDialog(
                        cubit,
                        context,
                        title: 'Report Reason :',
                        controller: reportController,
                        onPressed: (){
                          cubit.reportAnswer(
                              token:token,
                              answerId:answer.id,
                              reason:reportController.text
                          );
                          reportController.clear();
                        }
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        ImageAssets.reportIc
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              '${answer.content}',
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            SizedBox(
              height: AppSize.s30,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if(answer.isLiked==false) {
                          print(answer.id);
                          cubit.likeAnswer(answer.id);
                          answer.likesCount = answer.likesCount + 1;
                          answer.isLiked = !answer.isLiked;
                        }else
                        {
                          print(answer.id);
                          cubit.likeAnswer(answer.id);
                          answer.likesCount = answer.likesCount - 1;
                          answer.isLiked = !answer.isLiked;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            ImageAssets.upArrowIc,
                            width: AppSize.s14,
                            height: AppSize.s14,
                            color: ColorManager.purple5,
                          ),
                          const SizedBox(
                            width: AppSize.s4,
                          ),
                          Text(
                            '${answer.likesCount} Votes',
                            style: getSemiBoldStyle(color: ColorManager.purple6)
                                .copyWith(fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget answersBuilder(answers,question, context, cubit, state) => ConditionalBuilder(
  condition: state is! GetAnswerLoadingState && answers != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildAnswerItem(answers[index],question, context, cubit, state),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s8,
      ),
      itemCount: answers.length),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);

Widget buildAdviceItem(advice, context, cubit, state,) => Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppSize.s28), // Change the radius here
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: AppSize.s18,
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s20,
                  backgroundColor: ColorManager.white,
                  backgroundImage: imageSelector(image: advice.image,defaultImage: ImageAssets.employeeIc),
                ),
                const SizedBox(
                  width: AppSize.s14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${advice.name}',
                            style: const TextStyle(height: AppSize.s1_5),
                          ),
                          const SizedBox(
                            width: AppSize.s8,
                          ),
                          advice.isAuth
                              ? const Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                  size: AppSize.s16,
                                )
                              : const SizedBox(
                                  width: AppSize.s1_5,
                                ),
                        ],
                      ),
                      Text(
                          '${advice.time}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: AppSize.s1_5)),
                    ],
                  ),
                ),
                advice.isMine == true?
                InkWell(
                  onTap: (){
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(''),
                          content: SizedBox(
                              width: 40,
                              height: 80,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  InkWell(
                                      onTap:(){
                                        var editedAdviceController = TextEditingController(text: '${advice.content}');
                                        addingDialog(
                                          cubit,
                                          context,
                                          title: 'Edit Advice',
                                          controller: editedAdviceController,
                                          onPressed: () {
                                            cubit.editAdvice(
                                                adviceId : advice.id,
                                                content : editedAdviceController.text,
                                                token : token
                                            );
                                            cubit.getAdvicesLatest();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      },
                                      child: Text('Edit Advice',style: TextStyle(color: ColorManager.pending),)),
                                  const SizedBox(height: 20,),
                                  InkWell(
                                      onTap:(){
                                        showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Are You Sure'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Delete'),
                                                  onPressed: () {
                                                    cubit.deleteAdvice(advice.id);
                                                    cubit.getAdvicesLatest();
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Delete Advice',style: TextStyle(color: ColorManager.error))),
                                ],
                              )
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        ImageAssets.dotsIc
                    ),
                  ),
                ):
                InkWell(
                  onTap: (){
                    var reportController = TextEditingController();
                    addingDialog(
                        cubit,
                        context,
                        title: 'Report Reason :',
                        controller: reportController,
                        onPressed: (){
                          cubit.reportAdvice(
                              token:token,
                              adviceId:advice.id,
                              reason:reportController.text
                          );
                          reportController.clear();
                        }
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        ImageAssets.reportIc
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              '${advice.content}',
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            SizedBox(
              height: AppSize.s30,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if(advice.isLiked==false) {
                          print(advice.id);
                          cubit.likeAdvice(advice.id);
                          advice.likesCount = advice.likesCount + 1;
                          advice.isLiked = !advice.isLiked;
                        }else
                        {
                          print(advice.id);
                          cubit.likeAdvice(advice.id);
                          advice.likesCount = advice.likesCount - 1;
                          advice.isLiked = !advice.isLiked;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            ImageAssets.upArrowIc,
                            width: AppSize.s14,
                            height: AppSize.s14,
                            color: ColorManager.purple5,
                          ),
                          const SizedBox(
                            width: AppSize.s4,
                          ),
                          Text(
                            '${advice.likesCount} Votes',
                            style: getSemiBoldStyle(color: ColorManager.purple6)
                                .copyWith(fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget advicesBuilder(advices, context, cubit, state) => ConditionalBuilder(
  condition: state is! GetAdvicesLoadingState && advices != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildAdviceItem(advices[index], context, cubit, state),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s8,
      ),
      itemCount: advices.length),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);

Widget buildQuestionItem(question, context, cubit, state,) => InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionView(question),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppSize.s28), // Change the radius here
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: AppSize.s18,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s20,
                    backgroundColor: ColorManager.white,
                    backgroundImage: imageSelector(image: question.image,defaultImage: ImageAssets.employeeIc),
                  ),
                  const SizedBox(
                    width: AppSize.s14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${question.name}',
                              style: const TextStyle(height: AppSize.s1_5),
                            ),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            question.isAuth ?
                            const Icon(
                                    Icons.verified,
                                    color: Colors.lightBlue,
                                    size: AppSize.s16,
                                  ) :
                            const SizedBox(width: AppSize.s1_5,),
                          ],
                        ),
                        Text(
                            '${question.time}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(height: AppSize.s1_5)),
                      ],
                    ),
                  ),
                  question.isMine==true?
                  InkWell(
                    onTap: (){
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(''),
                            content: SizedBox(
                                width: 40,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    InkWell(
                                        onTap:(){
                                          var editedQuestionController = TextEditingController(text: '${question.content}');
                                          addingDialog(
                                            cubit,
                                            context,
                                            title: 'Edit Question',
                                            controller: editedQuestionController,
                                            onPressed: () {
                                              cubit.editQuestion(
                                                  questionId : question.id,
                                                  content : editedQuestionController.text,
                                                  token : token
                                              );
                                              cubit.getQuestionsLatest();
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                        child: Text('Edit Question',style: TextStyle(color: ColorManager.pending),)),
                                    const SizedBox(height: 20,),
                                    InkWell(
                                        onTap:(){
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Are You Sure'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Delete'),
                                                    onPressed: () {
                                                      cubit.deleteQuestion(question.id);
                                                      cubit.getQuestionsLatest();
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Delete Question',style: TextStyle(color: ColorManager.error))),
                                  ],
                                )
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          ImageAssets.dotsIc
                      ),
                    ),
                  ):
                  InkWell(
                    onTap: (){
                      var reportController = TextEditingController();
                      addingDialog(
                          cubit,
                          context,
                          title: 'Report Reason :',
                          controller: reportController,
                          onPressed: (){
                            cubit.reportQuestion(
                                token:token,
                                questionId:question.id,
                                reason:reportController.text
                            );
                            reportController.clear();
                          }
                      );
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          ImageAssets.reportIc
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                '${question.content}',
                style: getSemiBoldStyle(color: ColorManager.black),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              SizedBox(
                height: AppSize.s30,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if(question.isLiked==false) {
                            print(question.id);
                            cubit.likeQuestion(question.id);
                            question.likesCount = question.likesCount + 1;
                            question.isLiked = !question.isLiked;
                          }else
                          {
                            print(question.id);
                            cubit.likeQuestion(question.id);
                            question.likesCount = question.likesCount - 1;
                            question.isLiked = !question.isLiked;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageAssets.upArrowIc,
                              width: AppSize.s16,
                              height: AppSize.s16,
                              color: ColorManager.purple5,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              '${question.likesCount} Votes',
                              style: getBoldStyle(color: ColorManager.purple6)
                                  .copyWith(fontSize: FontSize.s14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageAssets.answersIc,
                              width: AppSize.s20,
                              height: AppSize.s20,
                              color: ColorManager.purple5,
                            ),
                            const SizedBox(
                              width: AppSize.s5,
                            ),
                            Text(
                              '${question.answersCount} Answers',
                              style: getBoldStyle(color: ColorManager.purple6)
                                  .copyWith(fontSize: FontSize.s14),
                            )
                          ],
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
    );

Widget questionsBuilder(questions, context, cubit, state) => ConditionalBuilder(
  condition: state is! CommunityLoadingState && questions != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildQuestionItem(questions[index], context, cubit, state),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s8,
      ),
      itemCount: questions.length),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);

Widget buildDetailedQuestionItem(question, context, cubit, state,) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s20,
                backgroundColor: ColorManager.purple4,
                backgroundImage: imageSelector(image: question.image,defaultImage: ImageAssets.employeeIc),
              ),
              const SizedBox(
                width: AppSize.s14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${question.name}',
                          style: const TextStyle(height: AppSize.s1_5),
                        ),
                        const SizedBox(
                          width: AppSize.s8,
                        ),
                        question.isAuth==true ?
                             const Icon(
                                Icons.verified,
                                color: Colors.lightBlue,
                                size: AppSize.s16,
                              )
                            : const SizedBox(
                                width: AppSize.s1_5,
                              ),
                      ],
                    ),
                    Text(
                        '${question.time}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(height: AppSize.s1_5)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            question.content,
            style: getMediumStyle(color: ColorManager.black)
                .copyWith(fontSize: FontSize.s17),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          SizedBox(
            height: AppSize.s30,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if(question.isLiked==false) {
                        print(question.id);
                        cubit.likeQuestion(question.id);
                        question.likesCount = question.likesCount + 1;
                        question.isLiked = !question.isLiked;
                      }else
                      {
                        print(question.id);
                        cubit.likeQuestion(question.id);
                        question.likesCount = question.likesCount - 1;
                        question.isLiked = !question.isLiked;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.upArrowIc,
                          width: AppSize.s16,
                          height: AppSize.s16,
                          color: ColorManager.purple5,
                        ),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        Text(
                          '${question.likesCount} Votes',
                          style: getBoldStyle(color: ColorManager.purple6)
                              .copyWith(fontSize: FontSize.s14),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.answersIc,
                          width: AppSize.s20,
                          height: AppSize.s20,
                          color: ColorManager.purple5,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '${question.answersCount} Answers',
                          style: getBoldStyle(color: ColorManager.purple6)
                              .copyWith(fontSize: FontSize.s14),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


///ANNOUNCEMENT
Widget buildAnnouncementItem(announcement, context, cubit, state) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(color: ColorManager.purple4, width: AppSize.s2),
            borderRadius: BorderRadius.circular(AppSize.s20),
            boxShadow: [
              BoxShadow(
                color: ColorManager.purple2,
                offset: const Offset(2, 2),
                blurRadius: AppSize.s5,
                spreadRadius: AppSize.s2,
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSize.s20,
                      backgroundColor: ColorManager.white,
                      backgroundImage: imageSelector(image: announcement.companyPhoto,defaultImage: ImageAssets.purpleLogo),
                    ),
                    const SizedBox(width: AppSize.s14),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            '${announcement.companyName}',
                            style: const TextStyle(height: AppSize.s1_5),
                          ),
                          const SizedBox(width: AppSize.s8),
                          const Icon(Icons.verified, color: Colors.lightBlue, size: AppSize.s16),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s10),
                Text(
                  '${announcement.title}',
                  style: getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined, color: ColorManager.purple5),
                              const SizedBox(width: AppSize.s5),
                               Text('${announcement.time}'),
                            ],
                          ),
                          const SizedBox(height: AppSize.s8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: ColorManager.purple5),
                              const SizedBox(width: AppSize.s5),
                               Text('${announcement.days}',),
                            ],
                          ),
                          const SizedBox(height: AppSize.s8),
                          Row(
                            children: [
                              Icon(Icons.person_outline, color: ColorManager.purple5),
                              const SizedBox(width: AppSize.s5),
                               Text('${announcement.companyEmail}',),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSize.s10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${announcement.startDate}',),
                          const SizedBox(height: AppSize.s14),
                          Text("From ${announcement.time}"),
                          const SizedBox(height: AppSize.s16),
                          Text('${announcement.companyEmail}',),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Icon(Icons.attach_money, color: ColorManager.pending),
                    const SizedBox(width: AppSize.s5),
                     Text("Price : ${announcement.price} SYP"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: AppSize.s0,
          right: AppSize.s0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s10, vertical: AppSize.s5),
            decoration: BoxDecoration(
              color: ColorManager.purple4,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s20),
                bottomLeft: Radius.circular(AppSize.s20),
              ),
            ),
            child: Text(
              announcement.type=="course"?"Course":"Internship",
              style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget announcementsBuilder(announcements, context, cubit, state) => ConditionalBuilder(
  condition: state is! AnnouncementsLoadingState && announcements != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildQuestionItem(announcements[index], context, cubit, state),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s20,
      ),
      itemCount: announcements.length),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);
///APPLICATIONS
Widget buildApplicationItem(application, context, cubit, state) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
    child: Stack(
      children: [
        Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,horizontal: AppPadding.p10),
        height: AppSize.s80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey.withOpacity(0.5),
              offset: const Offset(2, 2),
              blurRadius: AppSize.s5,
              spreadRadius: AppSize.s2,
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: AppSize.s60,
              height: AppSize.s60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorManager.purple4,
                  width: AppSize.s2,
                ),
              ),
              child: CircleAvatar(
                radius: AppSize.s350,
                backgroundColor: ColorManager.purple4,
                backgroundImage: imageSelector(image: application.publisherPhoto,defaultImage: ImageAssets.purpleLogo)
              ),
            ),
            const SizedBox(width: AppSize.s16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(application.jobTitle,style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),),
                const Spacer(),
                Text(application.publisherName,style: getMediumStyle(color: ColorManager.grey),),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,size: AppSize.s16,color: ColorManager.grey,),
                    Text(application.location??"No Location",style: getMediumStyle(color: ColorManager.grey),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
        Positioned(
          top: AppSize.s0,
          right: AppSize.s0,
          child: highlightedContainer(statusColor(application.status), AppSize.s20, application.status),
        ),
        Positioned(
          bottom: AppSize.s0,
          right: AppSize.s0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s10, vertical: AppSize.s0),
            decoration: BoxDecoration(
              color: ColorManager.grey.withOpacity(0.2),
              borderRadius:  const BorderRadius.only(
                bottomRight: Radius.circular(AppSize.s20),
                topLeft: Radius.circular(AppSize.s20),
              ),
            ),
            child: Text(
              "sent ${application.date}",
              style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s12),
            ),
          ),
        ),
        Positioned(
          left: AppSize.s0,
          top: AppSize.s0,
          child: InkWell(
              onTap: (){
                showDialog<void>(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Are you sure you want to cancel this job application ? '),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              cubit.cancelApplication(application.vacancyId);
                              cubit.getMyApplications();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                );
                },
              child: Icon(
                Icons.remove_circle,
                color: ColorManager.error,
                size: AppSize.s18,
              ),

          ),
        ),
      ]
    ),
  );
}
Widget applicationsBuilder(applications, context, cubit, state) => ConditionalBuilder(
  condition: state is! ApplicationsLoadingState && applications != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildApplicationItem(applications[index], context, cubit, state),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s8,
      ),
      itemCount: applications.length),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);
Color statusColor(status){
  if(status=="pending") {
    return ColorManager.pending;
  } else if(status=="accepted") {
    return ColorManager.success;
  } else if(status=="rejected") {
    return ColorManager.error;
  }else {
    return ColorManager.grey;
  }
}
ImageProvider<Object> imageSelector({required image,required defaultImage}){
  if(image==null) {
    return AssetImage(defaultImage);
  } else {
    return NetworkImage("${baseUrl}images/$image");
  }
}
///FILTER
Widget filterOptions(cubit,context)=>AlertDialog(
  title: const Text('Filter Options:'),
  content: SizedBox(
    width: double.maxFinite,
    child: Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            multiSelectionWidget(
                items: cubit.typeItems,
                title: "Job Types",
                icon: Icons.access_time,
                buttonText: "Choose Types",
                result: SearchCubit.selectedTypes
            ),
            multiSelectionWidget(
                items: cubit.cityItems,
                title: "Cities",
                icon: Icons.location_on_outlined,
                buttonText: "Choose Cities",
                result: SearchCubit.selectedCities
            ),
            multiSelectionWidget(
                items: cubit.categoriesItems,
                title: "Categories",
                icon: Icons.category_outlined,
                buttonText: "Choose Category",
                result: SearchCubit.selectedCategories
            ),
            multiSelectionWidget(
                items: cubit.sectionsItems,
                title: "Sections",
                icon: Icons.domain,
                buttonText: "Choose Sections",
                result: SearchCubit.selectedSections
            )
          ],
        ),
      ),
    ),
  ),
  actions: <Widget>[
    TextButton(
      child: const Text('Apply'),
      onPressed: () {
        cubit.getFilter();
        Navigator.of(context).pop();
      },
    ),
  ],
);




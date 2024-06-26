import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/values_manager.dart';
import '../modules/community/cubit/community_states.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

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

///COMMUNITY
Widget animatedTabBarItem(
  cubit,
  index,
  height,
  width,
  color,
) =>
    AnimatedContainer(
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

Widget buildAnswerItem(
  question,
  context,
  cubit,
  state,
) =>
    Card(
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
                  backgroundImage: const AssetImage(ImageAssets.employeeIc),
                  //backgroundImage: question.publisher.image=='null' ? const AssetImage(ImageAssets.splashLogo) :const AssetImage(ImageAssets.splashLogo),
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
                            "Anas Allahham",
                            //'${question.publisher}',
                            style: TextStyle(height: AppSize.s1_5),
                          ),
                          SizedBox(
                            width: AppSize.s8,
                          ),
                          //question.publisher.verified ?
                          1 == 1
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                  size: AppSize.s16,
                                )
                              : SizedBox(
                                  width: AppSize.s1_5,
                                ),
                        ],
                      ),
                      Text("13h ago",
                          //'${question.date}',
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
              height: AppSize.s10,
            ),
            Text(
              "First step to be a good employee.....mmm I guess you'll never be.",
              //'${question.body}',
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
                        // if(question.isLiked==false) {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount + 1;
                        //   question.isLiked = !question.isLiked;
                        // }else
                        // {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount - 1;
                        //   question.isLiked = !question.isLiked;
                        // }
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
                            "101 votes",
                            //'${question.likesCount} Votes',
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

Widget buildAdviceItem(
  question,
  context,
  cubit,
  state,
) =>
    Card(
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
                  backgroundImage: const AssetImage(ImageAssets.employeeIc),
                  //backgroundImage: question.publisher.image=='null' ? const AssetImage(ImageAssets.splashLogo) :const AssetImage(ImageAssets.splashLogo),
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
                            "Anas Allahham",
                            //'${question.publisher}',
                            style: TextStyle(height: AppSize.s1_5),
                          ),
                          SizedBox(
                            width: AppSize.s8,
                          ),
                          //question.publisher.verified ?
                          1 == 1
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                  size: AppSize.s16,
                                )
                              : SizedBox(
                                  width: AppSize.s1_5,
                                ),
                        ],
                      ),
                      Text("13h ago",
                          //'${question.date}',
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
              height: AppSize.s10,
            ),
            Text(
              "First step to be a good employee...is to suck my dick.",
              //'${question.body}',
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
                        // if(question.isLiked==false) {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount + 1;
                        //   question.isLiked = !question.isLiked;
                        // }else
                        // {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount - 1;
                        //   question.isLiked = !question.isLiked;
                        // }
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
                            "101 votes",
                            //'${question.likesCount} Votes',
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

Widget buildQuestionItem(
  question,
  context,
  cubit,
  state,
) =>
    Card(
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
                  backgroundImage: const AssetImage(ImageAssets.employeeIc),
                  //backgroundImage: question.publisher.image=='null' ? const AssetImage(ImageAssets.splashLogo) :const AssetImage(ImageAssets.splashLogo),
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
                            "Anas Allahham",
                            //'${question.publisher}',
                            style: TextStyle(height: AppSize.s1_5),
                          ),
                          SizedBox(
                            width: AppSize.s8,
                          ),
                          //question.publisher.verified ?
                          1 == 1
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.lightBlue,
                                  size: AppSize.s16,
                                )
                              : SizedBox(
                                  width: AppSize.s1_5,
                                ),
                        ],
                      ),
                      Text("13h ago",
                          //'${question.date}',
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
              height: AppSize.s10,
            ),
            Text(
              "What the fuck?",
              //'${question.body}',
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
                        // if(question.isLiked==false) {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount + 1;
                        //   question.isLiked = !question.isLiked;
                        // }else
                        // {
                        //   print(question.questionId);
                        //   cubit.Like(question.questionId);
                        //   question.likesCount = question.likesCount - 1;
                        //   question.isLiked = !question.isLiked;
                        // }
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
                            "101 votes",
                            //'${question.likesCount} Votes',
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
                            "20 answers",
                            //'${question.comentsCount} Answers',
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
    );

Widget buildDetailedQuestionItem(
  question,
  context,
  cubit,
  state,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s20,
                backgroundColor: ColorManager.purple4,
                backgroundImage: const AssetImage(ImageAssets.employeeIc),
                //backgroundImage: question.publisher.image=='null' ? const AssetImage(ImageAssets.splashLogo) :const AssetImage(ImageAssets.splashLogo),
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
                          "Anas Allahham",
                          //'${question.publisher}',
                          style: TextStyle(height: AppSize.s1_5),
                        ),
                        SizedBox(
                          width: AppSize.s8,
                        ),
                        //question.publisher.verified ?
                        1 == 1
                            ? Icon(
                                Icons.verified,
                                color: Colors.lightBlue,
                                size: AppSize.s16,
                              )
                            : SizedBox(
                                width: AppSize.s1_5,
                              ),
                      ],
                    ),
                    Text("13h ago",
                        //'${question.date}',
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
            "I currently work in insurance and I hate it. The issue is that I think I hate sitting in a desk for 8 hours everyday. I work in an office where it’s not really possible to have conversations with my coworkers so I pretty much stay silent for 8 hours a day minus the occasional meeting. ",
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
                      // if(question.isLiked==false) {
                      //   print(question.questionId);
                      //   cubit.Like(question.questionId);
                      //   question.likesCount = question.likesCount + 1;
                      //   question.isLiked = !question.isLiked;
                      // }else
                      // {
                      //   print(question.questionId);
                      //   cubit.Like(question.questionId);
                      //   question.likesCount = question.likesCount - 1;
                      //   question.isLiked = !question.isLiked;
                      // }
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
                          "101 votes",
                          //'${question.likesCount} Votes',
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
                          "20 answers",
                          //'${question.commentsCount} Answers',
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
Widget questionsBuilder(questions, cubit, context, state) => ConditionalBuilder(
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

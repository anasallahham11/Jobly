import 'package:flutter/material.dart';
import 'package:jobly/modules/home/home_layout_cubit.dart';
import 'package:jobly/modules/regular/job_details/job_details_view.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/values_manager.dart';
import '../modules/regular/jobs/jobs_cubit.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

//onboarding
class BoardingModle {
  final String image;
  final String title;
  final String body;
  BoardingModle({
    required this.body,
    required this.title,
    required this.image,
  });
}

Widget bulidBoardingItem(
  BoardingModle modle,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(modle.image))),
        const SizedBox(
          height: 30,
        ),
        Text(
          modle.title,
          style: getBoldStyle(color: Colors.black, fontSize: FontSize.s22),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          modle.body,
          style: getRegularStyle(color: Colors.black, fontSize: FontSize.s14),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );





    

//text from feld

Widget textFieldComponant(
  TextEditingController _passwordController,
  String AppStrings,
  InputBorder? border,
  bool obscureText,
) {
  return TextField(
    controller: _passwordController,
    decoration: InputDecoration(
      labelText: AppStrings,
      border: border,
    ),
    obscureText: obscureText,
  );
}

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
                      const Row(
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
                      const Row(
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
                      const Row(
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
                    const Row(
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
//Widget questionsBuilder(questions,cubit, context, state) => ConditionalBuilder(
//   condition: state is! CommunityLoadingState && questions != null,
//   builder: (context) => ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) =>
//           buildQuestionItem(questions[index],context,cubit,state),
//       separatorBuilder: (context,index) => const SizedBox(height: AppSize.s8,),
//       itemCount: questions.length
//   ),
//   fallback: (context) => const Center(child: CircularProgressIndicator()),
// );

///Layout
PreferredSizeWidget myAppBar(
  context,
  String title,
  bool searchVisible,
) {
  return AppBar(
        elevation: 0,
    shadowColor: Colors.transparent,
    foregroundColor: ColorManager.white,
    surfaceTintColor: ColorManager.white,
    // shadowColor: ColorManager.white,
    //forceMaterialTransparency: true,
    iconTheme: IconThemeData(
      color: ColorManager.primary,
      //color: Color.fromARGB(255, 164, 78, 179), // Change the color to red
    ),
    actions: [
      if (searchVisible)
        IconButton(
          icon: Icon(
            Icons.search,
            color: ColorManager.primary,
          ),
          //color: Color.fromARGB(255, 164, 78, 179)),
          onPressed: () {
            // navigateTo(context, const SearchScreen());
          },
        ),
    ],
    backgroundColor: ColorManager.white,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorManager.primary,

        // color: Color.fromARGB(255, 164, 78, 179),
      ),
    ),
  );
}

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
         DrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 115, 1, 115),
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            // Handle the home tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Handle the company list tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: const Icon(Icons.assignment),
          title: const Text('job applications'),
          onTap: () {
            // Handle the company list tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
      ],
    ),
  );
}

//jobs screen

Widget circularImage(
  context,
  String imageUrl,
  double radius,
) {
  return Card(
    color: ColorManager.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(200),
    ),
    elevation: 0,
    child: CircleAvatar(
      backgroundColor: ColorManager.white,
      radius: radius,
      backgroundImage: NetworkImage(
        imageUrl,
      ),
    ),
  );
}

//the company widget in the all jobs screen
Widget companyWidget(
  context,
  String imageUrl,
  String text,
) {
  return InkWell(
    onTap: () {
      // Navigate to CompanyProfileScreen and pass data
      Navigator.push(
        context,
        MaterialPageRoute(
          //it shhould lead to the company profile screen
          builder: (context) => const CoursesScreen(
              // imageUrl: imageUrl,
              // companyName: text,
              ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            circularImage(
              context,
              imageUrl,
              MediaQuery.of(context).size.width * 0.07,
            ),
            Text(
              text,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

//holds the company widgets in it
Widget companyHolder(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: companyData.length,
      itemBuilder: (context, index) {
        final company = companyData[index];
        return companyWidget(
          context,
          company['image']!,
          company['text']!,
        );
      },
    ),
  );
}

// Dummy company JSON Data
final List<Map<String, String>> companyData = [
  {
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfF0wZy7mQfdYr7u_rBgFUpF1-XYBJ6Alr5w&s",
    "text": "Syriatel"
  },
  {
    "image":
        "https://static.wixstatic.com/media/d2252d_4c1a1bda6a774bd68f789c0770fd16e5~mv2.png",
    "text": "Amazon"
  },
  {
    "image":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
    "text": "Google"
  },
  {
    "image":
        "https://play-lh.googleusercontent.com/DIQzLQuHuupEoCe8TfpUdrsYDicq2cSE_WTsrZ-Ys6ppLHKdc7m5dbyqmQqiJi0JfQ",
    "text": "Burger King"
  },
  {
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oTCfJdO8zwDoyHB7j5tktdQq31w6t31GsA&s",
    "text": "Lego"
  }
];

//most used widget

Widget jobVacancyWidget(
  context,
  String image,
  String title,
  String tag,
  String experience,
  String type,
  String salary,
  String company,
  String location,
) {
  return InkWell(
    onTap: () => navigateTo(context,
        JobDetailsView(companyName: company, imageUrl: image, salary: salary)),
    child: Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 249, 249, 249),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                color: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
                elevation: 0,
                child: CircleAvatar(
                  backgroundColor: ColorManager.white,
                  radius: MediaQuery.of(context).size.width * 0.05,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              //company logo
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(
                      '$company - $location',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 115, 1, 115)),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    tag,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 115, 1, 115)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              highlightedText(
                  type, const Color.fromARGB(255, 201, 231, 255), Colors.blue),
              highlightedText(experience,
                  const Color.fromARGB(255, 196, 255, 205), Colors.green),
              const Expanded(child: SizedBox()),
              Text(salary),
            ],
          ),
        ],
      ),
    ),
  );
}

//list of jobs
Widget jobsList(List<Map<String, String>> jobs) {
  return Expanded(
    child: ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return jobVacancyWidget(
          context,
          job['image']!,
          job['title']!,
          job['tag']!,
          job['experience']!,
          job['type']!,
          job['salary']!,
          job['company']!,
          job['location']!,
        );
      },
    ),
  );
}

Widget highlightedText(
  String text,
  Color background,
  Color textColor,
) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}

Widget highlightedIcon(Color background, Color iconColor, IconData icon) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(200),
    ),
    child: Icon(
      icon,
      color: iconColor,
      size: 30,
    ),
  );
}

Widget companyListTile(context, String imageUrl, String companyName) {
  return ListTile(
      onTap: () {
        navigateTo(
            context,
            const CoursesScreen(
                //imageUrl: imageUrl, companyName: companyName,
                ));
      },
      subtitle: const Text('⭐4.2 | 400 Reviews'),
      title: Text(companyName),
      leading: circularImage(
        context,
        imageUrl,
        MediaQuery.of(context).size.width * 0.05,
      ));
}

Widget squareButton(context) {
  return Positioned(
    bottom: 5,
    right: 5,
    child: FloatingActionButton(
      onPressed: () {},
      child: PopupMenuButton<String>(
        offset: const Offset(0, -100),
        onSelected: JobsCubit.get(context).changeIndex,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'For You',
            child: Text('For You'),
          ),
          const PopupMenuItem<String>(
            value: 'All',
            child: Text('All'),
          ),
        ],
      ),
    ),
  );
}

Widget buildGridView(
    List items,
    Widget Function(Color, Color, IconData, String, String, bool)
        gridItemBuilder) {
  return SizedBox(
    height: 140,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 0,
          childAspectRatio: 2.5,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return gridItemBuilder(
            const Color.fromARGB(
                255, 255, 180, 231), // Example background color
            const Color.fromARGB(255, 156, 0, 164), // Example icon color
            item['icon'], // Assuming 'icon' is IconData
            item['title'],
            item['subtitle'] ?? '', // Optional subtitle, default empty string
            item['isSubtitle'] ??
                false, // Optional isSubtitle flag, default false
          );
        },
      ),
    ),
  );
}

Widget titleAndDescription(context) {
  return Column(
    children: [
      //job description
      smallTitle('Job description'),
      //'Roles and Responsibilities:'
      jobDescription(
        context,
        'Roles and Responsibilities:',
        '''
● Code Review: Perform code reviews to ensure high code quality and adherence to best practices.
● Problem Solving: Identify, troubleshoot, and resolve complex issues and bugs.
● Documentation: Create and maintain technical documentation for systems and processes. 
● Testing: Implement and maintain robust testing strategies to ensure the reliability and performance of applications.''',
      ),
      //Perks and Benefits:
      jobDescription(
        context,
        'Perks and Benefits:',
        '''
● Stock Options: Potential to own part of Amazon through stock grants.
● Health Insurance: Comprehensive medical, dental, and vision insurance plans.
● Retirement Plans: 401(k) plan with company match.
● Paid Time Off: Generous paid vacation, sick leave, and parental leave.
● Employee Discounts: Discounts on Amazon products and services.''',
      ),
      //Role
      jobDescription(context, 'Role', '● Senior Software Engineer'),
      //Industry Type:
      jobDescription(context, 'Industry Type:', '''● E-commerce
● Technology'''),
      //Department
      jobDescription(context, 'Department:', '● Engineering'),
      //Employment Type
      jobDescription(context, 'Employment Type::', '● Full-time'),
      //Role Category
      jobDescription(context, 'Role Category:', '● Software Development'),
      //Education
      jobDescription(context, 'Education :',
          '''● Bachelor's Degree in Computer Science, Engineering, or a related field (Master's or Ph.D. preferred).
● Certifications in relevant technologies or methodologies (e.g., AWS Certification, Agile Certification) are a plus.'''),
    ],
  );
}

Widget myButton(
  BuildContext context,
  String buttonText,
  VoidCallback onPressed,
  Color textColor,
  Color backgroundColor,
  double width,
) {
  return MaterialButton(
    onPressed: onPressed,
    child: Container(
      width: width,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}

Widget jobDescription(context, String title, String description) {
  return Column(
    children: [
      ListTile(
        title: Text(title),
        subtitle: Text(description),
      ),
    ],
  );
}

Widget smallTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}

Widget customListTile(
  Color backgroundColor,
  Color iconColor,
  IconData icon,
  String title,
  String subtitle,
  bool isSubtitle,
) {
  if (isSubtitle == true) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          highlightedIcon(
            backgroundColor,
            iconColor,
            icon,
          ),
          // const Color.fromARGB(255, 255, 180, 231),
          // const Color.fromARGB(255, 156, 0, 164),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        highlightedIcon(
          backgroundColor,
          iconColor,
          icon,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

//functions

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

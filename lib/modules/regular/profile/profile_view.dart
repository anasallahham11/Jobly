import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobly/modules/regular/profile/cubit/profile_states.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/rami_widgets.dart';
import '../../../widgets/widgets.dart';
import '../edit_profile/edit_profile_view.dart';
import 'cubit/profile_cubit.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileDetails(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SafeArea(child: SizedBox()),
                CompanyProfileHeader(
                  context: context,
                  profileImage:
                      "${ProfileCubit.get(context).employeeModel?.data.employee.image.imageableType}",
                  backgroundImage:
                      "https://live.staticflickr.com/65535/49675583756_a078ac45a9_b.jpg",
                  name: '${ProfileCubit.get(context).employeeModel?.data.name}',
                  isProfile: true,
                ),
                footer(context),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget pointsAndPosts(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //favourite
      numberAndText(context, 87, 'Points'),
      //divider
      dividerVertical(context),
      //planning to read
      numberAndText(context, 8768, 'Posts')
    ],
  );
}

Widget infoRow(context) {
  return BlocBuilder<ProfileCubit, ProfileStates>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTextButton(context, 'About Me', 0),
                buildTextButton(context, 'Posts', 1),
                buildTextButton(context, 'Settings', 2),
              ],
            ),
            const SizedBox(height: 20),
            ProfileCubit.get(context).getSelectedWidget(context),
          ],
        ),
      );
    },
  );
}

Widget buildTextButton(context, String text, int index) {
  return GestureDetector(
    onTap: () => ProfileCubit.get(context).changeColor(index),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: ProfileCubit.get(context).selectedIndex == index
            ? Theme.of(context).primaryColor
            : ColorManager.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: ColorManager.purple4, width: 2),
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          color: ProfileCubit.get(context).selectedIndex == index
              ? ColorManager.white
              : Colors.black,
        ),
      ),
    ),
  );
}

Widget footer(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
         color: ColorManager.offWhite,
        // color: Color.fromARGB(255, 245, 245, 245),
        // borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          //points and posts
          pointsAndPosts(context),
          infoRow(context),
        ],
      ),
    ),
  );
}


  





Widget aboutMe(context) {
  return Column(
    children: [
      //about me
      jobDescription(context, '',
          '''${ProfileCubit.get(context).employeeModel?.data.employee.resume}'''),

      //exp
      jobDescription(
        context,
        'Work Experience:',
        '''
● ${ProfileCubit.get(context).employeeModel?.data.employee.experience}
''',
      ),
      //Education
      jobDescription(
          context, 'Education:', '''● ${ProfileCubit.get(context).employeeModel?.data.employee.education}'''),
      //skills
      jobDescription(context, 'Skills:', '''● Technical Skills:

      ${ProfileCubit.get(context).employeeModel?.data.employee.skills}

'''),

//contact
      jobDescription(context, 'Contact Information:', '''
● Name:
    ${ProfileCubit.get(context).employeeModel?.data.name}

● Email:
    ${ProfileCubit.get(context).employeeModel?.data.email}

● Phone:
 ${ProfileCubit.get(context).employeeModel?.data.employee.phoneNumber}

● Location:
 ${ProfileCubit.get(context).employeeModel?.data.address}
'''),

      //Perks and Benefits:
      jobDescription(
        context,
        'Links:',
        '''
● GitHub :
 https://github.com/johndoe

● LinkedIn :
 https://www.linkedin.com/in/johndoe
''',
      ),
    ],
  );
}

Widget posts(context) {
  final List<String> items = ['Question 1', 'Post 2', 'Post 3', 'Question 4'];

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: ColorManager.white,  // Example background color
            height: 100,
            width: 100,
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget settings(context) {
  return Column(
    children: [
      //language
      settingsTileSwitch(
        context,
        Icons.language_outlined,
        'Language',
        ProfileCubit.get(context).language,
        const Color.fromARGB(255, 100, 126, 255),
        const Color.fromARGB(255, 30, 4, 126),
        const EditProfileScreen(),
        true,
        ProfileCubit.get(context).isEnglish,
        ProfileCubit.get(context).changeLanguage,
      ),
      //darkmode
      settingsTileSwitch(
        context,
        ProfileCubit.get(context).icon,
        'Mode',
        ProfileCubit.get(context).mode,
        ProfileCubit.get(context).iconBackgroundColor,
        ProfileCubit.get(context).iconColor,
        const EditProfileScreen(),
        true,
        ProfileCubit.get(context).isDark,
        ProfileCubit.get(context).changeMode,
      ),
      //edit profile
      settingsTileSwitch(
        context,
        Icons.edit,
        'Edit Profile',
        '',
        const Color.fromARGB(255, 52, 255, 69),
        const Color.fromARGB(255, 0, 106, 21),
        const EditProfileScreen(),
        false,
        false,
        (value) {},
      ),
      //add video
      settingsTileSwitch(
        context,
        Icons.video_settings_rounded,
        'Add Video',
        '',
        const Color.fromARGB(255, 255, 100, 100),
        const Color.fromARGB(255, 214, 214, 214),
         showUploadDialog(context),
        false,
        false,
        (value) {},
      ),

      //add cv
        settingsTileSwitch(
        context,
        Icons.picture_as_pdf_outlined,
        'Add CV',
        '',
        const Color.fromARGB(255, 255, 100, 100),
        const Color.fromARGB(255, 214, 214, 214),
        showUploadCvDialog(context),
        false,
        false,
        (value) {},
      ),
    ],
  );
}

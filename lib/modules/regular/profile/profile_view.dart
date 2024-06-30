import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../edit_profile/edit_profile_view.dart';
import 'cubit/profile_cubit.dart';
import 'cubit/profile_states.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
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
                      "https://www.shutterstock.com/image-photo/happy-mid-aged-business-man-600nw-2307212331.jpg",
                  backgroundImage:
                      "https://live.staticflickr.com/65535/49675583756_a078ac45a9_b.jpg",
                  name: 'Jakop Asshole',
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
            : Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
            color: const Color.fromARGB(255, 132, 56, 145), width: 2),
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          color: ProfileCubit.get(context).selectedIndex == index
              ? Colors.white
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
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.all(Radius.circular(15)),
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
          '''I'm a passionate software engineer with a knack for problem-solving and a love for crafting robust, efficient code. With a background in [mention relevant experience or education], I thrive in dynamic environments where I can innovate and collaborate with like-minded professionals. From designing algorithms to debugging complex issues, I enjoy every aspect of the software development lifecycle. Outside of coding, I'm an avid learner, always exploring new technologies and trends to stay ahead in this ever-evolving field. Whether it's building scalable applications or optimizing existing systems, I'm dedicated to delivering solutions that make a real-world impact.'''),
      //summary
      jobDescription(context, 'Professional Summary:', '''
● Experienced software engineer with a passion for building scalable web applications. Proficient in Java, JavaScript, and frameworks like React and Spring. Dedicated to continuous learning and staying updated with industry trends.'''),
      //exp
      jobDescription(
        context,
        'Work Experience:',
        '''
● Software Engineer, Tech Solutions Inc.

- Duration:
January 2019 - Present
- Responsibilities:
Developed RESTful APIs using Spring Boot for backend services.
Implemented responsive front-end components using React and Redux.
Collaborated with cross-functional teams to deliver projects on time and within budget.
- Achievements:
Streamlined API performance, resulting in a 20% decrease in response time.
Led the migration of legacy systems to microservices architecture, improving scalability and reliability.

● Junior Software Developer, DevTech LLC.

- Duration:
 June 2017 - December 2018
- Responsibilities:
Assisted senior developers in coding and debugging web applications using JavaScript and Angular.
Participated in code reviews and testing phases to ensure product quality.
Maintained and updated documentation for internal APIs and software components.
''',
      ),
      //Education
      jobDescription(
          context, 'Education:', '''● Bachelor of Science in Computer Science
University of Technology, Cityville
Graduated: May 2017'''),
      //skills
      jobDescription(context, 'Skills:', '''● Technical Skills:
- Languages: Java, JavaScript, Python
- Frameworks: Spring Boot, React, Angular
- Databases: MySQL, MongoDB
- Tools & Technologies: Git, JIRA, Docker
● Soft Skills:
 Problem-solving, teamwork, effective communication
'''),

//contact
      jobDescription(context, 'Contact Information:', '''
● Email:
 john.doe@example.com

● Phone:
 +1 (555) 123-4567

● Location:
 San Francisco, CA, USA
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
            color: Colors.white, // Example background color
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
        const EditProfileScreen(),
        false,
        false,
        (value) {},
      ),
    ],
  );
}

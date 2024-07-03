import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/widgets.dart';
// import '../edit_profile/edit_profile_view.dart';
import '../edit_profile/edit_profile_view.dart';
import 'cubit/company_profile_cubit.dart';
import 'cubit/company_profile_states.dart';

class CompanyProfileScreen extends StatelessWidget {
  final String imageUrl;
  final String companyName;

  const CompanyProfileScreen({
    super.key,
    required this.imageUrl,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyProfileCubit()..getCompanyInfo(1),
      child: BlocConsumer<CompanyProfileCubit, CompanyProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CompanyProfileCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeArea(child: SizedBox()),
                  //image/logo/name/back button
                  companyProfileHeader(
                    context,
                    cubit.company,
                    cubit,
                    'https://www.planetizen.com/files/images/shutterstock_192086159.jpg',
                    false,
                  ),
                  jobDescription(context, 'About Us:',cubit,cubit.company),
                      // '''Google is a global technology leader focused on improving the ways people connect with information. Founded in 1998 by Larry Page and Sergey Brin, Google specializes in internet-related services and products, including search engines, online advertising technologies, cloud computing, software, and hardware. Known for its innovative approach and commitment to organizing the world’s information, Google continues to be a pioneer in the tech industry.'''),
                   seeAll(context, 'jobs from $companyName',
                       const EditProfileScreen()),
                  // jobsHorizontal(
                  //     context, CompanyProfileCubit.get(context).companyJobs),
                  // seeAll(context, 'What do people have to say about us ?',
                  //     const EditProfileScreen()),
                  // reviews(context, imageUrl),
                  // myButton(context, 'Add a Review', () {}, ColorManager.white,
                  //     Theme.of(context).primaryColor, double.infinity)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Widget seeAll(context, String text, Widget page) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         TextButton(
//           onPressed: () {
//             navigateTo(context, page);
//           },
//           child: const Text('See All'),
//         ),
//       ],
//     ),
//   );
// }

Widget jobDescription(context, String title, cubit,company) {
  return Column(
    children: [
      ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(company.companyName),
      ),
    ],
  );
}

Widget companyProfileHeader(
  context,
  company,
  cubit,
  String backgroundImage,
  bool isProfile,
) {
  return Stack(
    children: [
      // Background Image
      SizedBox(
        height: isProfile
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.45,
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: isProfile
                ? MediaQuery.of(context).size.height * 0.35
                : MediaQuery.of(context).size.height * 0.4,
          ),
        ),
      ),
      // Optional Rounded Border
      if (!isProfile)
        Positioned(
          bottom: 30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
        ),
      // Profile or Company Image
      isProfile
          ? Positioned(
              left: MediaQuery.of(context).size.width * 0.3,
              bottom: 0,
              top: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          company.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    company.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ],
              ),
            )
          : Positioned(
              bottom: -4,
              left: 10,
              child: circularImage(context, company.profileImage, 50),
            ),

      // Optional Back Button
      isProfile ? const Text('') : backButtonrounded(context),
      // Company Name for Company Header
      if (!isProfile)
        Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          bottom: 10,
          child: Text(
            company.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      isProfile
          ? Positioned(
              bottom: 45,
              right: MediaQuery.of(context).size.width * 0.25,
              child: InkWell(
                  child: highlightedIcon(Theme.of(context).primaryColor,
                      Colors.white, Icons.play_arrow_rounded, 30)))
          : const Text(''),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/widgets.dart';
import 'cubit/company_profile_cubit.dart';
import 'cubit/company_profile_states.dart';

class CompanyProfileScreen extends StatelessWidget {
  final String imageUrl;

  const CompanyProfileScreen({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => CompanyProfileCubit()..getCompanyDetails(1),
      child: BlocConsumer<CompanyProfileCubit, CompanyProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CompanyProfileCubit.get(context);
           if (state is CompanyLoadingState) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is CompanyErrorState) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Center(child: Text('Error: ${state.error}')),
            );
          } else if (cubit.company == null) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeArea(child: SizedBox()),
                  CompanyProfileHeader(
                    context: context,
                     profileImage: 'https://www.planetizen.com/files/images/shutterstock_192086159.jpg',
                      backgroundImage: 'https://www.planetizen.com/files/images/shutterstock_192086159.jpg',
                      name: cubit.company.companyName,
                      isProfile: false,
                      
                      ),
                     jobDescription(context, 'About Us:',
                      '''${cubit.company.companyDescription}'''),
                  
                  myButton(context, 'Add a Review', () {}, Colors.white,
                      Theme.of(context).primaryColor, double.infinity)
               
                  ],
              ),
            ),
          );
          }
        },
      ),
    );
  }
  //   return BlocProvider(
  //     create: (context) => CompanyProfileCubit()..getCompanyInfo(1),
  //     child: BlocConsumer<CompanyProfileCubit, CompanyProfileStates>(
  //       listener: (context, state) {},
  //       builder: (context, state) {
  //         var cubit = CompanyProfileCubit.get(context);
  //         return Scaffold(
  //           backgroundColor: ColorManager.white,
  //           body: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const SafeArea(child: SizedBox()),
  //                 //image/logo/name/back button
  //                 companyProfileHeader(
  //                   context,
  //                   cubit.company,
  //                   cubit,
  //                   'https://www.planetizen.com/files/images/shutterstock_192086159.jpg',
  //                   false,
  //                 ),
  //                 jobDescription(context, 'About Us:',cubit,cubit.company),
  //                     // '''Google is a global technology leader focused on improving the ways people connect with information. Founded in 1998 by Larry Page and Sergey Brin, Google specializes in internet-related services and products, including search engines, online advertising technologies, cloud computing, software, and hardware. Known for its innovative approach and commitment to organizing the world’s information, Google continues to be a pioneer in the tech industry.'''),
  //                  seeAll(context, 'jobs from $companyName',
  //                      const EditProfileScreen()),
  //                 // jobsHorizontal(
  //                 //     context, CompanyProfileCubit.get(context).companyJobs),
  //                 // seeAll(context, 'What do people have to say about us ?',
  //                 //     const EditProfileScreen()),
  //                 // reviews(context, imageUrl),
  //                 // myButton(context, 'Add a Review', () {}, ColorManager.white,
  //                 //     Theme.of(context).primaryColor, double.infinity)
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
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



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
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
      create: (context) => CompanyProfileCubit(),
      child: BlocConsumer<CompanyProfileCubit, CompanyProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeArea(child: SizedBox()),
                  //image/logo/name/back button
                  CompanyProfileHeader(
                    context: context,
                    profileImage: imageUrl,
                    backgroundImage:
                        'https://www.planetizen.com/files/images/shutterstock_192086159.jpg',
                    name: companyName,
                    isProfile: false,
                  ),
                  jobDescription(context, 'About Us:',
                      '''Google is a global technology leader focused on improving the ways people connect with information. Founded in 1998 by Larry Page and Sergey Brin, Google specializes in internet-related services and products, including search engines, online advertising technologies, cloud computing, software, and hardware. Known for its innovative approach and commitment to organizing the world’s information, Google continues to be a pioneer in the tech industry.'''),
                  seeAll(context, 'jobs from $companyName',
                      const EditProfileScreen()),
                  jobsHorizontal(
                      context, CompanyProfileCubit.get(context).companyJobs),
                  seeAll(context, 'What do people have to say about us ?',
                      const EditProfileScreen()),
                  reviews(context, imageUrl),
                  myButton(context, 'Add a Review', () {}, Colors.white,
                      Theme.of(context).primaryColor, double.infinity)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/regular/job_details/cubit/job_details_cubit.dart';
import 'package:jobly/modules/regular/job_details/cubit/job_details_states.dart';
import 'package:jobly/utils/constants.dart';

import '../../../resources/color_manager.dart';
import '../../../widgets/widgets.dart';


class JobDetailsView extends StatelessWidget {
  final int id;


  const JobDetailsView({
    super.key,
    required this.id
  });

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (context)=>JobDetailsCubit()..getJobDetails(id),
        child: BlocConsumer<JobDetailsCubit,JobDetailsStates>(
            listener: (context,state){
              if(state is JobApplySuccessState) {
                showToast(text: "Applied Successfully", state: ToastStates.SUCCESS);
              }
            },
            builder: (context,state){
              var cubit = JobDetailsCubit.get(context);
              final List<Map<String, dynamic>> items = [
                {
                  'title': 'Salary',
                  'subtitle': "salaryRange",
                  'icon': Icons.attach_money,
                  'isSubtitle': true,
                },
                {
                  'title': 'Type',
                  'subtitle': "jobType",
                  'icon': Icons.work,
                  'isSubtitle': true,
                },
                {
                  'title': 'Work Hour',
                  'subtitle': '40 hrs/week',
                  'icon': Icons.access_time,
                  'isSubtitle': true,
                },
                {
                  'title': 'Experience',
                  'subtitle': '2 years',
                  'icon': Icons.school,
                  'isSubtitle': true,
                },
              ];
              return Scaffold(
                appBar: myAppBar(context, '          Job Details', false),
                backgroundColor: ColorManager.white,
                body: ConditionalBuilder(
                    condition: state is! JobDetailsLoadingState && cubit.job!=null,
                    builder: (context)=>SingleChildScrollView(
                  child: Column(
                    children: [
                      //image
                      circularImage(
                          context, "${baseUrl}images${cubit.job.publisherPhoto}", MediaQuery.of(context).size.width * 0.2),
                      //role
                      Text(
                          cubit.job.description
                      ),
                      //company
                      Text(
                        cubit.job.companyName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      //location
                      Text("cubit.job.location"),
                      //gridview
                      buildGridView(items, (
                          backgroundColor,
                          iconColor,
                          icon,
                          title,
                          subtitle,
                          isSubtitle,
                          ) {
                        return customListTile(
                          backgroundColor,
                          iconColor,
                          icon,
                          title,
                          subtitle,
                          isSubtitle,
                        );
                      }),
                      //job description
                      titleAndDescription(context),
                      //company info
                      companyListTile(context, "${baseUrl}images${cubit.job.publisherPhoto}", cubit.job.companyName),
                      //apply button
                      myButton(
                        context,
                        'Apply',
                            () {cubit.applyToJob(id);},
                        ColorManager.white,
                        ColorManager.purple5,
                        double.infinity,
                      ),
                    ],
                  ),
                ),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),
                ),
              );
            },
        ),
    );
  }
}

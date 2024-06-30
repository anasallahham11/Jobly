import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/widgets.dart';
import 'jobs_cubit.dart';
import 'jobs_states.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsCubit(),
      child: BlocConsumer<JobsCubit, JobsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Column(

                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
               myAppBar(context,'JOBLY',true),

                  companyHolder(context),
                  jobsVertical(JobsCubit.get(context).getCurrentList()),
                ],
              ),
               squareButton(
                context,
             const ['For You', 'All'],
             JobsCubit.get(context).changeIndex,
          ) ,
            ],
          );
        },
      ),
    );
  }
}

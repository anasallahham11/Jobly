
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/resources/assets_manager.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/font_manager.dart';
import 'package:jobly/resources/style_manager.dart';
import 'package:jobly/resources/values_manager.dart';

import '../../widgets/anas_widgets.dart';
import '../../widgets/widgets.dart';
import 'cubit/announcements_cubit.dart';
import 'cubit/announcements_states.dart';


class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AnnouncementsCubit(),
        child: BlocConsumer<AnnouncementsCubit, AnnouncementsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AnnouncementsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  elevation: AppSize.s0,
                  backgroundColor: ColorManager.white,
                  title: Text('Announcements',style: getMediumStyle(color: ColorManager.darkPrimary).copyWith(fontSize: FontSize.s22),),
                ),
                backgroundColor: ColorManager.offWhite,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const SizedBox(height: AppSize.s14,),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            buildAnnouncementItem(null, context, cubit, state),
                            const SizedBox(height: 20),
                            buildAnnouncementItem(null, context, cubit, state),
                            const SizedBox(height: 20),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ));

  }}

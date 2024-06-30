import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/resources/color_manager.dart';
import '../../widgets/widgets.dart';
import 'home_layout_cubit.dart';
import 'home_layout_states.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            drawer:  myDrawer(context),
            backgroundColor: ColorManager.white,   
            bottomNavigationBar: myNavBar(context),
            body: HomeCubit.get(context)
                .screens[HomeCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}


Widget myNavBar(context) {
  return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 115, 1, 115),
      type: BottomNavigationBarType.fixed,
      currentIndex: HomeCubit.get(context).currentIndex,
      onTap: (index) {
        HomeCubit.get(context).changeIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Posts',
        ),
      ]);
}

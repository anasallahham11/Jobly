import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_layout_states.dart';

class HomeCubit extends Cubit<HomeLayoutStates> {
  HomeCubit() : super(HomeLayoutInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const JobsScreen(),
    const ProfileScreen(),
    const CoursesScreen(),
    const PostsScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeLayoutChangeTabState());
  }
}


class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
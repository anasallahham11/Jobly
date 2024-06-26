
import 'package:flutter_bloc/flutter_bloc.dart';

import 'announcements_states.dart';


class AnnouncementsCubit extends Cubit<AnnouncementsStates>{
  AnnouncementsCubit() : super(AnnouncementsInitialState());
  static AnnouncementsCubit get(context) => BlocProvider.of(context);

  List<String> type = [
    "Course",
    "Internship",
  ];

  int currentIndex=0;
  void changeTabBar(int index)
  {
    currentIndex= index;
    emit(ChangeTabBarState());
  }

///GET COURSES
// PostsModel? postsModel;
// List<dynamic>? posts;
// void getPosts()
// {
//   emit(PostsLoadingState());
//   DioHelper.getData(
//     url: GETPOSTS,
//     token: token,
//   ).then((value) {
//     print(value?.data);
//     postsModel = PostsModel.fromJson(value?.data);
//     print(postsModel?.status);
//     print(postsModel?.message);
//     print(postsModel?.data[0]);
//     posts = postsModel?.data;
//     emit(PostsSuccessState());
//   }).catchError((error){
//     print(error.toString());
//     emit(PostsErrorState(error.toString()));
//   });
// }




}
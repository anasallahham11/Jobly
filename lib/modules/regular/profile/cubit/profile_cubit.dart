import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/helpers/cache_helper.dart';
import '../../../../utils/helpers/dio_helper.dart';
import '../profile_view.dart';
import 'profile_states.dart';


class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileAboutMeState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void changeColor(int index) {
    selectedIndex = index;
    emit(ProfileChangeState());
  }

  Widget getSelectedWidget(context) {
    switch (selectedIndex) {
      case 0:
        return aboutMe(context);
      case 1:
        return posts(context);
      case 2:
        return settings(context);
      default:
        return const SizedBox.shrink();
    }
  }

bool isEnglish = false;  // Initial value of the switch
  String language = 'English';         // Initial value of the text widget

  void changeLanguage(bool value) {
      isEnglish = value;
      language = value ? 'Arabic' : 'English'; 
      emit(ChangeLanguageState()); // Update the text value based on the switch state
    
  }


  bool isDark = false;  // Initial value of the switch
  String mode = 'Dark';     
  IconData icon  =  Icons.dark_mode; 
  Color iconColor =const Color.fromARGB(255, 0, 58, 94) ;
  Color iconBackgroundColor =const Color.fromARGB(255, 0, 102, 165) ;// Initial value of the text widget
  // Initial value of the text widget

  void changeMode(bool value) {
      isDark = value;
      mode = value ? 'Light' : 'Dark'; 
      iconColor = value ? const Color.fromARGB(255, 201, 124, 0): const Color.fromARGB(255, 0, 58, 94);
      iconBackgroundColor = value ?const Color.fromARGB(255, 255, 191, 0): const Color.fromARGB(255, 0, 137, 222);
      icon = value ?Icons.light_mode: Icons.dark_mode ;

      emit(ChangeLanguageState()); // Update the text value based on the switch state
    
  }


  ///get profile data
  
  

//upload video
     ImagePicker picker= ImagePicker();
     void uploadVideo(){
      print("sdddddddddddddddddddddddddddddddddddddd");

      CacheHelper.init();
      emit(UploadVideoLodingState());
      DioHelper.uploadVideo(filePath: "$picker", token: '$token', endpoint: 'employee/upload/video').then((value) {
      print("rami");
      print(value?.data);

      emit(UploadVideoSucsessState());
    }).catchError((error) {
      emit(UploadVideoErorrState(error.toString()));
    });
     }
//upload cv
     FilePickerResult? file_picker;
     void uploadCv(){
      print("sdddddddddddddddddddddddddddddddddddddd");

      CacheHelper.init();
      emit(UploadCVLodingState());
      DioHelper.uploadCV(filePath: "$file_picker", token: '$token', endpoint: 'employee/cv/upload').then((value) {
      print("rami");
      print(value?.data);
      emit(UploadCVSucsessState());
    }).catchError((error) {
      emit(UploadCVErorrState(error.toString()));
    });
     }




}





import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/sign_up/sign_up_employy/cubit/states.dart';
import 'package:jobly/utils/constants.dart';

import '../../../../../utils/end_points.dart';
import '../../../../../utils/helpers/cache_helper.dart';
import '../../../../../utils/helpers/dio_helper.dart';
import '../signup_modle_employy.dart';

class SignUpEmployyCubit extends Cubit<SignUpEmployyState> {
  SignUpEmployyCubit() : super(SignUpEmployyInitial());

  static SignUpEmployyCubit get(context) => BlocProvider.of(context);

  String? graduationStatus;
  String? workingStatus;


  void changeGraduationStatus(bool isGraduated) {
    graduationStatus = isGraduated ? 'Graduated' : 'Not Graduated';
    emit(GraduationStatusState(graduationStatus: graduationStatus!));
  }

  void changeWorkingStatus(String status) {
    workingStatus = status;
    emit(WorkingStatusState(workingStatus: workingStatus!));
  }

    
  Future<void> employySignUp({
    required String age,
    required String resume,
    required String experience,
    required String education,
     var  portfolio,
    required String phone_number,
      String? filePath,
     String? imagename,
  }) async {
   // print("${age+"*"+resume+"**"+experience+"**"+education+"*"+portfolio+"**"+phone_number+"**"+workingStatus!+"**"+graduationStatus!+"**"}");
   print("*********'Bearer ${CacheHelper.getData(key: 'token')}'**************************+$filePath+*********+$imagename");
emit(SignUpEmployyLoading());
var data = FormData.fromMap({
  'date_of_birth': '2006-06-05',
  'resume': 'resume',
  'experience': 'experience',
  'education': 'education',
  'portfolio': 'portfolio',
  'phone_number': '0988795032',
  'work_status': 'working',
  'graduation_status': 'graduated',
  'photo': await MultipartFile.fromFile(filePath!,filename: imagename)
});

var dio = Dio();
dio.post(
  '$baseUrl/employee/create/employee',
  data: data,
  options: Options(
    headers: {
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'}
  )
  
)
.then((value) {
      print(value.data);
      emit(SignUpEmployySuccess());
} ).catchError((error) {
      emit(SignUpEmployyError(error.toString(), error: '${error.toString()}'));
    });






    

  // void userSignUp({
  //   required String email,
  //   required String password,
  //   required String name,
  // }) {
  //   CacheHelper.init();
  //   emit(SignUpEmployyLoading());
  //   DioHelper.postData(
  //     token:CacheHelper.getData(key: 'token') ,
  //     url: SIGHNUPEMPLOYY,
  //     data: {
  //       'email': email,
  //       'name':name,
  //       'password': password,
  //       'role':"1",
  //     },
  //   ).then((value) {
  //     print("rami");

  //     print(value?.data);
      
  //   //   var dataResponse= UserSignupModle.fromJson(value?.data);
  //   //   token = dataResponse.data?.token;
  //   //   print(token);
  //   //   CacheHelper.saveData(key: 'token', value:token );
  //   //  print( CacheHelper.getData(key: 'token'));

  //     emit(SignUpEmployySuccess());
  //   }).catchError((error) {
  //     emit(SignUpEmployyError(error.toString(), error: '${error.toString()}'));
  //   });
  // }
  }}
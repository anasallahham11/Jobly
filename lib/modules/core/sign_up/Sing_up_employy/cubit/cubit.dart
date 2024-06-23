




import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/sign_up/Sing_up_employy/cubit/states.dart';
import 'package:jobly/utils/constants.dart';

import '../../../../../utils/end_points.dart';
import '../../../../../utils/helpers/cache_helper.dart';
import '../../../../../utils/helpers/dio_helper.dart';

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

    





  Future<void> userSignUp({
    required String age,
    required String resume,
    required String experience,
    required String education,
     var  portfolio,
    required String phone_number,
     var file_path,
  
    
  }) async {
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
};
var data = FormData.fromMap({
  'files': [
    await MultipartFile.fromFile(file_path, filename: 'image')
  ],
  'age': age,
  'resume': resume,
  'experience': experience,
  'education': education,
  'portfolio': portfolio,
  'phone_number': phone_number,
  'work_status': workingStatus,
  'graduation_status': graduationStatus
});

var dio = Dio();
var response = await dio.request(
  '$baseUrl/employee/create/employee',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
}
else {
  print(response.statusMessage);
}
  }




    

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
}
import 'package:bloc/bloc.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/login/cubit/states.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/end_points.dart';
import '../../../../utils/helpers/cache_helper.dart';
import '../../../../utils/helpers/dio_helper.dart';
import '../login_modle.dart';



class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    CacheHelper.init();
    emit(LoginLoadingStates());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print("rami");
      print(value?.data);
      var dataResponse= LoginModle.fromJson(value?.data);
      token = dataResponse.data?.token;
      
      CacheHelper.saveData(key: 'token', value:token );
     print( CacheHelper.getData(key: 'token'));

      emit(LoginSuccessStates());
    }).catchError((error) {
      emit(LoginErorrStates(error.toString()));
    });
  }
}
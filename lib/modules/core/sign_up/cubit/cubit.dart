import 'package:bloc/bloc.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/sign_up/cubit/states.dart';

import '../../../../utils/end_points.dart';
import '../../../../utils/helpers/dio_helper.dart';




class SignUpCubit extends Cubit<SignupStates> {
  SignUpCubit() : super(SignupIntStates());

  static SignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
    required String email,
    required String password,
  }) {
    emit(SignupLoadingStates());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print("rami");
      print(value?.data);
      emit(SignupSuccessStates());
    }).catchError((error) {
      emit(SignupErorrStates(error.toString()));
    });
  }
}
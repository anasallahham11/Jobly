
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/modules/core/sign_up/sign_up_fav/cubit/states.dart';

import '../../../../../utils/end_points.dart';
import '../../../../../utils/helpers/cache_helper.dart';
import '../../../../../utils/helpers/dio_helper.dart';
import '../signup_fav_modle.dart';
import '../signup_getcat_modle.dart';

class SignUpFavCubit extends Cubit<SignupFavStates> {
  SignUpFavCubit() : super(SignupIntFavStates());

  static SignUpFavCubit get(context) => BlocProvider.of(context);

  void AddressSignUp({
    required String favid,
  }) {
    DioHelper.postData(
      
      url: SIGHNUPADDFAV,
      data: {
        'job_section_id': favid,    
      },
      token: CacheHelper.getData(key: 'token')
    ).then((value) {
      print("rami");
      
      var dataResponse= AddFav.fromJson(value?.data);

      print(dataResponse.data?.jopsSectionId);


      emit(SignupFavSuccessStates());
    }).catchError((error) {
      emit(SignupFavErorrStates(error.toString()));
    });
  }



 List<dynamic> cat=[];
  void getCat(){
    emit(SignupFavLoadingStates());
    if(cat.length==0)
    {
      DioHelper.getData(
      url: SIGHNUPGETCAT,
      token: CacheHelper.getData(key: 'token'),
      ).then((value) {
              cat=value?.data['data'];
              print(cat);
              var dataResponse= GetCat.fromJson(value?.data);
              print(dataResponse.data?[0].category);
              emit(SignupFavSuccessStates());
      })
      .catchError((error)
              {
                print(error.toString());
                emit(SignupFavErorrStates(error.toString()));
                });


    }else{
        emit(SignupFavSuccessStates());
      }
  }




//  List<dynamic> sub_cat=[];
//   void getSubCat(){
//     emit(SignupFavLoadingStates());
//     if(sub_cat.length==0)
//     {
//       DioHelper.getData(
//       url:SIGHNUPGETSUBCAT,

//       token: CacheHelper.getData(key: 'token'),
//       ).then((value) {
//               cat=value?.data['data'];
//               print(cat);
//               emit(SignupFavSuccessStates());
//       })
//       .catchError((error)
//               {
//                 print(error.toString());
//                 emit(SignupFavErorrStates(error.toString()));
//                 });


//     }else{
//         emit(SignupFavSuccessStates());
//       }
//   }




}
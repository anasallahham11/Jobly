abstract class ProfileStates{
  const ProfileStates();
    @override
  List<Object> get props => [];
}
class ProfileAboutMeState extends ProfileStates{}
class ProfilePostsState extends ProfileStates{}
class ProfileInfoState extends ProfileStates{}

class ProfileChangeState extends ProfileStates{}
class DarkThemeState extends ProfileStates{}
class LightThemeState extends ProfileStates{}

class ChangeLanguageState extends ProfileStates{}


//VIDEO
class UploadVideoLodingState extends ProfileStates{}



class UploadVideoSucsessState extends ProfileStates{}



class UploadVideoErorrState extends ProfileStates
{
  final String erorr;

  UploadVideoErorrState(this.erorr);
}

//CV

class UploadCVLodingState extends ProfileStates{}



class UploadCVSucsessState extends ProfileStates{}



class UploadCVErorrState extends ProfileStates
{
  final String erorr;

  UploadCVErorrState(this.erorr);
}







//PROFILE

class ProfileLoadingState extends ProfileStates{}



class ProfileSucsessState extends ProfileStates{}



class ProfileErrorState extends ProfileStates
{
  final String error;

  ProfileErrorState(this.error);
}



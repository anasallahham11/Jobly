abstract class ProfileStates{}
class ProfileAboutMeState extends ProfileStates{}
class ProfilePostsState extends ProfileStates{}
class ProfileInfoState extends ProfileStates{}

class ProfileChangeState extends ProfileStates{}
class DarkThemeState extends ProfileStates{}
class LightThemeState extends ProfileStates{}

class ChangeLanguageState extends ProfileStates{}



//
class ProfileInitialState extends ProfileStates{}

class ProfileLoadingState extends ProfileStates{}

class ProfileSuccessState extends ProfileStates{}

class ProfileErrorState extends ProfileStates{
  final String error;
  ProfileErrorState(this.error);
}
//
class UploadVideoLodingState extends ProfileStates{}



class UploadVideoSucsessState extends ProfileStates{}



class UploadVideoErorrState extends ProfileStates
{
  final String erorr;

  UploadVideoErorrState(this.erorr);
}


class UploadCVLodingState extends ProfileStates{}



class UploadCVSucsessState extends ProfileStates{}



class UploadCVErorrState extends ProfileStates
{
  final String erorr;

  UploadCVErorrState(this.erorr);
}

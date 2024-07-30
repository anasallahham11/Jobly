abstract class ProfileStates{}
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

class UploadProfileLodingState extends ProfileStates{}



class UploadProfileSucsessState extends ProfileStates{}



class UploadProfileErorrState extends ProfileStates
{
  final String erorr;

  UploadProfileErorrState(this.erorr);
}
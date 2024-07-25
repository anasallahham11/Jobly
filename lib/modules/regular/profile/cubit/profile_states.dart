abstract class ProfileStates{}
class ProfileAboutMeState extends ProfileStates{}
class ProfilePostsState extends ProfileStates{}
class ProfileInfoState extends ProfileStates{}

class ProfileChangeState extends ProfileStates{}
class DarkThemeState extends ProfileStates{}
class LightThemeState extends ProfileStates{}

class ChangeLanguageState extends ProfileStates{}



class UploadVideoLodingState extends ProfileStates{}



class UploadVideoSucsessState extends ProfileStates{}



class UploadVideoErorrState extends ProfileStates
{
  final String erorr;

  UploadVideoErorrState(this.erorr);
}


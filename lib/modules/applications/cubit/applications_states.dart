
abstract class ApplicationsStates{}

class ApplicationsInitialState extends ApplicationsStates{}

class ApplicationsLoadingState extends ApplicationsStates{}

class ApplicationsSuccessState extends ApplicationsStates{}

class ApplicationsErrorState extends ApplicationsStates{
  final String error;
  ApplicationsErrorState(this.error);
}
class ChangeTabBarState extends ApplicationsStates{}




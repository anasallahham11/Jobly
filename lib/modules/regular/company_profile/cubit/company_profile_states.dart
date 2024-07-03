abstract class CompanyProfileStates{}
class CompanyProfileInitialState extends CompanyProfileStates{}
class CompanyLoadingState extends CompanyProfileStates{}
class CompanySuccsssState extends CompanyProfileStates{}
class CompanyErrorState extends CompanyProfileStates{
  final String error;
  CompanyErrorState(this.error);
}


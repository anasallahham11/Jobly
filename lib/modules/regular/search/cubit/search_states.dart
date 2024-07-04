abstract class SearchStates{}

class SearchInitialState extends SearchStates{}

class SearchLoadingState extends SearchStates{}

class SearchSuccessState extends SearchStates{}

class SearchErrorState extends SearchStates{
  final String error;
  SearchErrorState(this.error);
}
class FilterLoadingState extends SearchStates{}

class FilterSuccessState extends SearchStates{}

class FilterErrorState extends SearchStates{
  final String error;
  FilterErrorState(this.error);
}

class CategoriesLoadingState extends SearchStates{}

class CategoriesSuccessState extends SearchStates{}

class CategoriesErrorState extends SearchStates{
  final String error;
  CategoriesErrorState(this.error);
}

class SectionsLoadingState extends SearchStates{}

class SectionsSuccessState extends SearchStates{}

class SectionsErrorState extends SearchStates{
  final String error;
  SectionsErrorState(this.error);
}

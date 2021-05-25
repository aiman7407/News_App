part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}
class BottomNavBarState extends NewsState {}
class ChangeBottomNavBarState extends NewsState {}
class ChangeModeState extends NewsState {}


// buisness
class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSucssesState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {

  final String error;

  NewsGetBusinessErrorState({this.error});
}



// Sports


class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSucssesState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {

  final String error;

  NewsGetSportsErrorState({this.error});
}


//science
class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSucssesState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {




  final String error;

  NewsGetScienceErrorState({this.error});
}



class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSucssesState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {




  final String error;

  NewsGetSearchErrorState({this.error});
}
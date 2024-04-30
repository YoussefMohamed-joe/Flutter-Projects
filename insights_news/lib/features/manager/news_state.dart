import 'package:insights_news/features/Model/new_model/new_model.dart';

class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsErrorState extends NewsStates {

  String error;
  NewsErrorState({required this.error});
}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {

  NewModel newModel;
  NewsSuccessState({required this.newModel});
}


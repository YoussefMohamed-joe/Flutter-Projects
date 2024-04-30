import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/manager/news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  

  getNewsByCategory(){
    emit(NewsLoadingState());
    try{
      ApiServices.getNewsCategory().then((value) {

        emit(NewsSuccessState(newModel: value!  ));
      });
    }catch(e){
      emit(NewsErrorState(error: e.toString()));
    }
  }
}
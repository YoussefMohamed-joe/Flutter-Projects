import 'package:charity_app/features/manager/price/price_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceCubit extends Cubit<PriceStates> {
  PriceCubit() : super(PriceInitialState());

   int initialPrice = 0 ;
   int price = 0;
   int counter = 1;

  setpPrice(int price){
     counter = 1;
    initialPrice = price;
    this.price = price;
  }
  increasePrice() {
    price+=initialPrice;
    counter++;
    emit(PriceUpdatedState());
  }

  decreasePrice() {

    if(counter>1){
      price-=initialPrice;
      counter--;
    }
    emit(PriceUpdatedState());
  }
}
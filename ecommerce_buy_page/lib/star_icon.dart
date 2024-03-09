import 'package:ecommerce_buy_page/AppColors.dart';
import 'package:flutter/material.dart';

class star extends StatelessWidget {
  const star({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(      
      onPressed: (){
        
      }, 
      iconSize: 30,
      icon: Icon(
        Icons.star_border
        ,color: AppColors.dB,
        ));
  }
}

class stars extends StatelessWidget {
  const stars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
                    star(),
                    star(),
                    star(),
                    star(),
                    star(),
    ],);
  }
}
import 'package:ecommerce_buy_page/AppColors.dart';
import 'package:flutter/material.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => NameState();
}
int counter = 1;
class NameState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if(counter>1){
                  counter--;
                }
              });
              
            },
            icon: Icon(Icons.remove,color: AppColors.dB,),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lB,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 20,color: AppColors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.add,color: AppColors.white,),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.dB,
            ),
          ),
        ],
      ),
    );
  }
}

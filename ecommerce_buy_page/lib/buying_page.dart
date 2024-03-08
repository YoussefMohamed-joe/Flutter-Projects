
import 'package:ecommerce_buy_page/AppColors.dart';
import 'package:flutter/material.dart';

class Buy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.lB,
      appBar: AppBar(
        backgroundColor: const Color(0xfffbd6a9),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.dB,),
        ),
      ),
      body:  Padding(
        padding:  const EdgeInsets.all(30),
        child: Center(
          child: Column(    
            crossAxisAlignment: CrossAxisAlignment.start,        
            children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  image: AssetImage('assets/offer.png')
                  ),
              ),

              const SizedBox(
                height: 15,
              ),
              //text
              Text(
                'Yomnista Combo',
                style: TextStyle(
                  color: AppColors.dB,
                  fontSize: 30,
                  fontWeight: FontWeight.bold, 
                ),
                ),
                const SizedBox(
                height: 15,
              ),
              //adding
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.dB,
                  ),
                  const SizedBox(
                width: 8,
                 ),
                  const Text('4(3)',style: TextStyle(fontSize: 15),),
                  const Spacer(),
                  
                ],
              ),
              //description
          
              //add to cart
          
              //divider
          
              //review
          
              //add a comment
          
              //rating
          
            ],
          ),
        ),
      )

    );
  }
}
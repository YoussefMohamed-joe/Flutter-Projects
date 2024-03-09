
import 'package:ecommerce_buy_page/AppColors.dart';
import 'package:ecommerce_buy_page/add_remove.dart';
import 'package:ecommerce_buy_page/star_icon.dart';
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
          child: SingleChildScrollView(
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
                    const Text('4(3)',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    const Number()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //description
                Text(
                  'Description',
                  style: TextStyle(
                    color: AppColors.dB,
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const Text('Buy Italian Pizza Get one free !',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                const SizedBox(
                  height: 15,
                ),
                //add to cart
                 Row(
                  children: [
                    const Text('EGP 420',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('ADD TO CART',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                  height: 50,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: AppColors.orange,
                ),
                Row(

                  children: [
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  
                        Text(
                          'Review',
                          style: TextStyle(
                            color: AppColors.dB,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                          ),),
                          const Text('Send Your Feedback Now',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_up_rounded),style: IconButton.styleFrom(iconSize: 32),),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                  ],
                ),  
                const SizedBox(
                  height: 20,
                ),          
                //add a comment
                SizedBox(
                  width: double.infinity, 
                  height: 120,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(  
                      filled: true,
                      fillColor: AppColors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Add a comment...',
                      hintStyle: TextStyle(color: AppColors.orange)
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                //rating
                Row(
                  children: [
                    stars(),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.dB,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      height: 40,
                      width: 70,
                      child: Center(
                        child: Text(                          
                          'SEND',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lB
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}
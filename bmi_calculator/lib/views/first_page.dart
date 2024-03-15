import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  
  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.db,
      appBar: AppBar(
        backgroundColor: AppColors.db,
        centerTitle: true,
        title: Text('Bmi Calculator',style: TextStyle(color: AppColors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //male,female
                Expanded(child: Row(
                  children: [
                    //male
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lb,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: AppColors.white,
                              size: 80,
                              ),
                              const SizedBox(
                             height: 5,
                              ),
                              Text('male',style: TextStyle(fontSize: 20,color: AppColors.white,fontWeight: FontWeight.w300))
                          ],
                        ),
                        
                      ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //female
                      Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lb,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: AppColors.white,
                              size: 80,
                              ),
                              const SizedBox(
                             height: 5,
                              ),
                              Text('female',style: TextStyle(fontSize: 20,color: AppColors.white,fontWeight: FontWeight.w300))
                          ],
                        ),                
                      ),
                    ),
                    
                  ],
                )),
                //height
                
                Expanded(child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lb,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w300),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('180',style: TextStyle(color: AppColors.white,fontSize: 40),),
                          Text('cm',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Slider(
                        value: 180, 
                        min: 100,
                        max: 200,
                        onChanged: (value){

                        })
                    ],
                  ),
                )),
                //weight,age
                Expanded(child: Row(
          
                )),
                //button
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: (){}, 
                    child:  const Text('Calculate',style: TextStyle(fontSize: 20),)),
                )
              ],
          ),
        ),
      ),
    );
  }
}
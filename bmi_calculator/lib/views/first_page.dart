import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/views/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  
  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  int height=170;
  int weight = 90;
  int age = 24;
  bool isMale=true;
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
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){setState(() {
                          isMale=true;
                        });},
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale? AppColors.pink : AppColors.lb,
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //female
                      Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){setState(() {
                          isMale=false;
                        });},
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale? AppColors.lb : AppColors.pink,
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
                          Text(height.toString(),style: TextStyle(color: AppColors.white,fontSize: 40),),
                          Text('cm',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(), 
                        min: 100,
                        max: 200,
                        activeColor: AppColors.pink,
                        inactiveColor: AppColors.grey,
                        onChanged: (value){
                          setState(() {
                            height=value.toInt();
                          });
                        })
                    ],
                  ),
                )),
                //weight,age
                Expanded(child: Row(
                  children: [
                    //weight
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lb,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w300),),
                            Text(weight.toString(),style: TextStyle(color: AppColors.white,fontSize: 40),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    if (weight>10){
                                      weight--;
                                    }
                                    
                                  });
                                }, iconSize: 30, color: AppColors.white, icon: Icon(Icons.remove),style: IconButton.styleFrom(
                                  backgroundColor: AppColors.grey,
                                  
                                ),),
                                const SizedBox(
                                  width: 5,
                                ),
                                 IconButton(onPressed: (){
                                  setState(() {
                                    if (weight<200){
                                      weight++;
                                    }
                                  });
                                 },iconSize: 30,color: AppColors.white, icon: Icon(Icons.add),style: IconButton.styleFrom(
                                  backgroundColor: AppColors.grey,
                                  
                                ),)
                              ],
                            )

                          ],
                        ),
                        
                      ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //age
                     Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lb,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('age',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w300),),
                            Text(age.toString(),style: TextStyle(color: AppColors.white,fontSize: 40),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    if (age>20){
                                      age--;
                                    }
                                    
                                  });
                                }, iconSize: 30, color: AppColors.white, icon: Icon(Icons.remove),style: IconButton.styleFrom(
                                  backgroundColor: AppColors.grey,
                                  
                                ),),
                                const SizedBox(
                                  width: 5,
                                ),
                                 IconButton(onPressed: (){
                                  setState(() {
                                    if (age<100){
                                      age++;
                                    }
                                  });
                                 },iconSize: 30,color: AppColors.white, icon: Icon(Icons.add),style: IconButton.styleFrom(
                                  backgroundColor: AppColors.grey,
                                  
                                ),)
                              ],
                            )

                          ],
                        ),
                        
                      ),
                      ),
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
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
                    onPressed: (){
                      //bmi= weight / height*2
                      double res = weight/((height*height*0.0001));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultPage(res: res)
                        ));
                    }, 
                    child:  const Text('Calculate',style: TextStyle(fontSize: 20),)),
                )
              ],
          ),
        ),
      ),
    );
  }
}
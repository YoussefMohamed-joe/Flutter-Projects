import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/views/first_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.res});
  final double res;
  String findResultAdults(){
    if(res<=16){
      return 'Severe Thinness';
    }
    else if (res>16 && res<=17){
      return 'Moderate Thinness';
    }
    else if (res>17 && res<=18.5){
      return 'Moderate Thinness';
    }
    else if (res>18.5 && res<=25){
      return 'Normal';
    }
    else if (res>25 && res<=30){
      return 'Overweight';
    }
    else if (res>30 && res<=35){
      return 'Obese Class I';
    }
    else if (res>35 && res<=40){
      return 'Obese Class II';
    }
    else if (res>40){
      return 'Obese Class III';
    }
    return 'rip';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.db,
      appBar: AppBar(
        backgroundColor: AppColors.db,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Result',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lb,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      findResultAdults(),
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 30
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      res.toStringAsFixed(1),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 60
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            res.toStringAsFixed(2),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 25
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>const FirstPage()));
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Recalculate'
                  ,style: TextStyle(fontSize: 20),
                )),
            )
          ],
        ),
      ),
    );
  }
}


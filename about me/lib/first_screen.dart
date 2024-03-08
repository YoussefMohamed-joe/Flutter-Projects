import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 85, 174),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 85, 174),
        leadingWidth: 150,
        leading: const Center(
          child: Text(
            'Contact Me',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),

      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/pp.jpg'),               
              ),

            const Text(
              'Youssef Mohamed',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),
          ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 193, 176, 218)),
          ),

            const Divider(
              color: Color.fromARGB(255, 193, 176, 218),
              thickness: 2,
              height: 30,
              indent: 95,
              endIndent: 95,
          ),

            Container(
              margin: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),   
                border: Border.all(),
                boxShadow:  const[
                  BoxShadow(color: Color.fromARGB(255, 131, 124, 124),
                    spreadRadius: 2,
                    blurRadius: 20,

                  ),
                ],         
              ),
              width: double.infinity,
              height: 70,
              child:  const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.call,color: Color.fromARGB(255, 75, 35, 134)),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '01019369440',
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 75, 35, 134)),
                  ),
                ],
              ),
            ),

            Container(
               margin: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),   
                border: Border.all(),
                boxShadow:  const[
                  BoxShadow(color: Color.fromARGB(255, 131, 124, 124),
                    spreadRadius: 2,
                    blurRadius: 20,
                  ),
                ],         
              ),
              width: double.infinity,
              height: 70,
              child:  const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.email,color: Color.fromARGB(255, 75, 35, 134)),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'mohammedyoussef111@gmail.com',
                    style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 75, 35, 134)),
                  ),
                ],
              ),
            ),

            Container(
               margin: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),   
                border: Border.all(),
                boxShadow:  const[
                  BoxShadow(color: Color.fromARGB(255, 131, 124, 124),
                    spreadRadius: 2,
                    blurRadius: 20,

                  ),
                ],         
              ),
              width: double.infinity,
              height: 70,
              child:  const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.facebook_rounded,color: Color.fromARGB(255, 75, 35, 134)),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'youssef moahmmed',
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 75, 35, 134)),
                  ),
                ],
              ),
            ),
          ],
        

        ),
      ),
    
    
    );
  }
}

import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  const FavouriteContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Favourite Contacts',style: getTextStyleBold(),),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column( 
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBYck0SnkWo0du3ug-Fhxea5oPf9FGh7ePI_Bt214ZUQ&s'),
                    ),
                    const SizedBox(height: 10,),
                    Text('Salah',style: getSmallTextStyle(color: AppColors.white),)
                  ],
                  
                );
              }, 
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              }, 
              itemCount: 11),
          ),
        ],
      ),
    );
  }
}
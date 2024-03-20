import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:chat_ui/features/chat/presentaion/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bl,
      appBar: AppBar(
        backgroundColor: AppColors.bl,
        title: Text('Chats',style: getTextStyleBold(size: 25),),
        actions: [IconButton(onPressed: () {},icon: const Icon(Icons.settings),color: AppColors.white,)],
      ),
      body: Column(
        
        children: [
          const FavouriteContacts(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return  ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBYck0SnkWo0du3ug-Fhxea5oPf9FGh7ePI_Bt214ZUQ&s'),
                    ),
                    title: Text('saleh meow',maxLines: 1,overflow: TextOverflow.ellipsis,style: getTextStyleBold(size: 20,color: AppColors.black),),
                    subtitle: Text('hi Saleh!!',maxLines: 1,overflow: TextOverflow.ellipsis,style: gettitleTextStyle(color: AppColors.black),),
                    trailing: Text('10 : 00 PM',style: getSmallTextStyle(),),
                  );
                }, 
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                }, 
                itemCount: 10),
            ),
          )
        ],
      ),
    );
  }
}


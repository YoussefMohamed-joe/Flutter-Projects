import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:chat_ui/features/chat/presentaion/model/user_model.dart';
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
                return SizedBox(
                  width: 65,
                  child: Column( 
                    children: [
                       CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(users[index].image),
                      ),
                      const SizedBox(height: 10,),
                      Text(users[index].name.split(' ')[0],maxLines: 1 ,overflow: TextOverflow.ellipsis,style: getSmallTextStyle(color: AppColors.white),)
                    ],
                    
                  ),
                );
              }, 
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              }, 
              itemCount: users.length),
          ),
        ],
      ),
    );
  }
}
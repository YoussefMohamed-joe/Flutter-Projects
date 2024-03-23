import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:chat_ui/features/chat/presentaion/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bl,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bl,
        foregroundColor: AppColors.white,
        title: Text(
          user.name,
          style: getTextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz_outlined),
            iconSize: 30,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(user.image),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.time, style: getSmallTextStyle()),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 250,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteclose,
                                      borderRadius:
                                          BorderRadius.circular(15)),
                                  child: Text(
                                    'hello, Wassup!',
                                    style:
                                        getTextStyle(color: AppColors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 250,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteclose,
                                      borderRadius:
                                          BorderRadius.circular(15)),
                                  child: Text(
                                    'how are you?',
                                    style:
                                        getTextStyle(color: AppColors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text('Now', style: getSmallTextStyle()),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 250,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      color: AppColors.bl,
                                      borderRadius:
                                          BorderRadius.circular(15)),
                                  child: Text(
                                    'I am good wtb you, how is your family, i just finished eating while watching some movie, come eat',
                                    style: getTextStyle(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),const SizedBox(
                          height: 80,
                        ),
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: AppColors.whiteclose,
                                  filled: true,
                                  suffixIcon: 
                                       IconButton(
                                          onPressed: (){},
                                          color: AppColors.white,
                                          icon: Icon(Icons.send),
                                          style: IconButton.styleFrom(
                                            backgroundColor: AppColors.bl
                                          ),
                                        ),
                                
                                  hintText: 'Type your message here',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide.none)),
                            )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/create_room_button.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key,required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      color: Constants.secondary,
      elevation: isDesktop ? 1 : 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.secondary,
        ),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
            scrollDirection: Axis.horizontal,
            itemCount: 1+onlineUsers.length,
            itemBuilder: (BuildContext context, int index){
              if(index==0){
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CreateRoomButton(),
                );
              }
              final User user= onlineUsers[index-1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(imageUrl: user.imageUrl,isActive: true,),
              );
            }),
      ),
    );
  }
}

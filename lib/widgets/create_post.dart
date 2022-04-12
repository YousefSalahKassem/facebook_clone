import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/model/user_model.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class CreatePost extends StatelessWidget {
  final User currentUser;
  const CreatePost({Key? key,required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      color: Constants.secondary,
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)):null,
      child: Container(
        decoration: BoxDecoration(
          color: Constants.secondary,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8,),
                Expanded(child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'What\'s on your mind ?',hintStyle: TextStyle(color: Colors.grey[200])),
                ))
              ],
            ),
            Divider(height: 10,thickness: .5,color: Colors.grey[600]?.withOpacity(.5),),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(onPressed: (){}, icon: const Icon(Icons.videocam,color: Colors.red,), label: Text('Live',style: TextStyle(color: Colors.grey[200]),)),
                  VerticalDivider(width: 8,color: Colors.grey[600]?.withOpacity(.5),),
                  FlatButton.icon(onPressed: (){}, icon: const Icon(Icons.photo_library,color: Colors.green,), label: Text('Photo',style: TextStyle(color: Colors.grey[200]))),
                  VerticalDivider(width: 8,color: Colors.grey[600]?.withOpacity(.5),),
                  FlatButton.icon(onPressed: (){}, icon: const Icon(Icons.video_call,color: Colors.pinkAccent,), label: Text('Room',style: TextStyle(color: Colors.grey[200]))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

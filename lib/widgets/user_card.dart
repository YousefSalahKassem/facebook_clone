import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;


  const UserCard({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(imageUrl: user.imageUrl),
        const SizedBox(width: 6,),
        Flexible(child: Text(user.name,style: const TextStyle(fontSize: 16,color: Colors.white),overflow: TextOverflow.ellipsis,))
      ],
    );
  }
}

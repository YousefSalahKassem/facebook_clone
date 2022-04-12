import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/postButton.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Constants.facebookBlue,
                shape: BoxShape.circle
              ),
              child: const Icon(Icons.thumb_up,size: 10,color: Colors.white,),
            ),
            const SizedBox(width: 4,),
            Expanded(child: Text('${post.likes}',style: TextStyle(color: Colors.grey[600]),)),
            Text('${post.comments} Comments',style: TextStyle(color: Colors.grey[600]),),
            const SizedBox(width: 8,),
            Text('${post.shares} Shares',style: TextStyle(color: Colors.grey[600]),),
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(icon: Icon(MdiIcons.thumbUpOutline,color: Colors.grey[600],size: 20,),label:'Like',onTap:(){}),
            PostButton(icon: Icon(MdiIcons.commentOutline,color: Colors.grey[600],size: 20,),label:'Comment',onTap:(){}),
            PostButton(icon: Icon(MdiIcons.shareOutline,color: Colors.grey[600],size: 25,),label:'Share',onTap:(){})
          ],
        )
      ],
    );
  }
}

import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
              Row(
                children: [
                  Text('${post.timeAgo} . ',style: TextStyle(color: Colors.grey[600],fontSize: 12),),
                  Icon(Icons.public,color: Colors.grey[600],size: 12,),
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: Colors.grey[600],)),
        isDesktop?Container():IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Colors.grey[600],)),

      ],
    );
  }
}

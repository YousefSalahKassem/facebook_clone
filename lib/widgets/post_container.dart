import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/post_header.dart';
import 'package:facebook_clone/widgets/post_stats.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      color: Constants.secondary,
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0,vertical: 5),
      elevation: isDesktop ? 1 : 0,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 5),
        padding:const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Constants.secondary,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post:post),
                  const SizedBox(height: 4,),
                  Text(post.caption,style: const TextStyle(color: Colors.white),),
                  post.imageUrl.isNotEmpty ? const SizedBox.shrink() : const SizedBox(height: 6,)
                ],
              ),
            ),
            post.imageUrl.isNotEmpty? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            ):const SizedBox.shrink(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PostStats(post:post)

            )
          ],
        ),
      ),
    );
  }
}

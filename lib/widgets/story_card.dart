import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

   const StoryCard({Key? key,this.isAddStory=false,required this.currentUser,required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory?currentUser.imageUrl:story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
            width: 110,
          decoration: BoxDecoration(
            gradient: Constants.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isDesktop(context) ?const [BoxShadow(color: Colors.black26,offset: Offset(0, 2),blurRadius: 4)] : null
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory?
            Container(
              height:40 ,
              width: 40 ,
              decoration: const BoxDecoration(
                color: Constants.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  iconSize: 30,
                  color: Colors.white,
                  padding: EdgeInsets.zero,
              ),
            ):ProfileAvatar(imageUrl: story.user.imageUrl,hasBorder: !story.isViewed,)
        ),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(isAddStory?"Add to Story":story.user.name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),maxLines: 2,overflow: TextOverflow.ellipsis,)),

      ],
    );
  }
}

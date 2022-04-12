import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:facebook_clone/widgets/story_card.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({Key? key,required this.currentUser,required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent :Constants.secondary,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 1+stories.length,
          itemBuilder: (BuildContext context, int index){
            if(index==0){
              return  Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: StoryCard(
                  isAddStory:true,
                  currentUser:currentUser,
                  story: stories[0],
                ),
              );
            }
            final Story story=stories[index-1];

            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                story:story,
                currentUser: currentUser,
              ),
            );
          }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constant/constants.dart';
import '../data/data.dart';
import '../model/post_model.dart';
import '../widgets/circle_button.dart';
import '../widgets/create_post.dart';
import '../widgets/post_container.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';

class HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeScreenMobile({Key? key,required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Constants.secondary,
          title: const Text('facebook',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,letterSpacing: -1.2),),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(icon: Icons.search, iconSize: 25, onPressed: (){}),
            CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 25, onPressed: (){}),
          ],
        ),
        const SliverToBoxAdapter(
          child:CreatePost(currentUser: currentUser) ,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child:Rooms(onlineUsers: onlineUsers) ,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child:Stories(currentUser: currentUser,stories:stories) ,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final Post post=posts[index];
                  return PostContainer(post:post);
                },
                childCount: posts.length
            )
        )
      ],
    );
  }
}

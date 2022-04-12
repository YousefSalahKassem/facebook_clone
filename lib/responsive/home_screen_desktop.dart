import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/post_model.dart';
import '../widgets/contacts_list.dart';
import '../widgets/create_post.dart';
import '../widgets/more_options_list.dart';
import '../widgets/post_container.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeScreenDesktop({Key? key,required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: MoreOptionsList(currentUser: currentUser),
              ),
            )),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                sliver: SliverToBoxAdapter(
                  child:Stories(currentUser: currentUser,stories:stories) ,
                ),
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
          ),
        ),
        const Spacer(),
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ContactsList(users: onlineUsers),
              ),
            )),
      ],
    );
  }
}

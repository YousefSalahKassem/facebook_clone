import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/widgets/options.dart';
import 'package:facebook_clone/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/user_model.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList=const [
    [MdiIcons.shieldAccount,Colors.deepPurple,'COVID-19 Info Center'],
    [MdiIcons.accountMultiple,Colors.cyan,'Friends'],
    [MdiIcons.shieldAccount,Colors.deepPurple,'Messenger'],
    [MdiIcons.facebookMessenger,Constants.facebookBlue,'COVID-19 Info Center'],
    [MdiIcons.flag,Colors.orange,'Pages'],
    [MdiIcons.storefront,Constants.facebookBlue,'Marketplace'],
    [Icons.ondemand_video,Constants.facebookBlue,'Watch'],
    [MdiIcons.calendarStar,Colors.red,'Events'],
  ];

  final User currentUser;
  const MoreOptionsList({Key? key,required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
          itemCount: 1+_moreOptionsList.length,
          itemBuilder: (BuildContext context, int index){
            if(index==0){
              return Padding(padding: const EdgeInsets.symmetric(vertical: 8),child: UserCard(user: currentUser),);
            }
            final List option=_moreOptionsList[index-1];
            return Padding(padding: EdgeInsets.symmetric(vertical: 8),child: Option(icon: option[0],color:option[1],label:option[2]),);
          }),
    );
  }
}

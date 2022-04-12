import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/model/models.dart';
import 'package:facebook_clone/widgets/circle_button.dart';
import 'package:facebook_clone/widgets/custom_tab_bar.dart';
import 'package:facebook_clone/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomAppBar({Key? key,required this.currentUser,required this.icons,required this.selectedIndex,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Constants.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          const Icon(Icons.facebook,color: Constants.facebookBlue,size: 40,),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 40,
            width: 220,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration:BoxDecoration(
              color: Constants.third,
              borderRadius: BorderRadius.circular(40),
            ) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Icon(Icons.search,color: Colors.grey[500],),
              const SizedBox(width: 5,),
              Text('Search Facebook',style: TextStyle(color: Colors.grey[500]),)
            ],),
          ),
          const Spacer(),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(icons: icons, selectedIndex: selectedIndex, onTap: onTap,isBottomIndicator:true ,),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user:currentUser),
              const SizedBox(width: 12,),
              CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 25, onPressed: (){}),
              CircleButton(icon: Icons.notifications_sharp, iconSize: 25, onPressed: (){}),
              CircleButton(icon: Icons.arrow_drop_down_rounded, iconSize: 25, onPressed: (){}),
            ],
          )
        ],
      ),
    );
  }
}

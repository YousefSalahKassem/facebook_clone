import 'package:facebook_clone/constant/constants.dart';
import 'package:flutter/material.dart';


class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  const CustomTabBar({Key? key,required this.icons,required this.selectedIndex,required this.onTap, this.isBottomIndicator=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator:  BoxDecoration(
        border: isBottomIndicator? const Border(
          bottom: BorderSide(color: Constants.facebookBlue,width: 3)
        ): const Border(
            top: BorderSide(color: Constants.facebookBlue,width: 3)
        )
      ),
      tabs: icons.asMap().map((i,e) => MapEntry(i, Tab(icon: Icon(e,color: i==selectedIndex?Constants.facebookBlue:Colors.grey[400],size: 25,),))).values.toList(),
      onTap: onTap,
    );
  }
}

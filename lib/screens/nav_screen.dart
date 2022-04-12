import 'package:facebook_clone/constant/constants.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home_screen.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  final List<Widget> _screens =[
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<IconData> _icons=[
  Icons.home,
  Icons.ondemand_video,
  MdiIcons.accountCircleOutline,
  MdiIcons.accountGroupOutline,
  MdiIcons.bellOutline,
  Icons.menu
  ];

  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    final Size screenSize= MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)?PreferredSize(
              child: CustomAppBar(
                  currentUser:currentUser,
                  icons: _icons,
                  selectedIndex: selectedIndex,
                  onTap: (index){
                    setState(() {
                      selectedIndex=index;
                    });
                  }
              ),
              preferredSize: Size(screenSize.width, 100)):null,
          body: IndexedStack(index: selectedIndex,children: _screens,),
          bottomNavigationBar: !Responsive.isDesktop(context)? Container(
            color: Constants.secondary,
            padding: const EdgeInsets.only(bottom: 5.0),
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: selectedIndex,
              onTap: (index){
                setState(() {
                selectedIndex=index;
                });
              }
            ),
          ):const SizedBox.shrink(),
        )
    );
  }
}

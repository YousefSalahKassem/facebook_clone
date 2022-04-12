import 'package:facebook_clone/responsive/home_screen_desktop.dart';
import 'package:facebook_clone/responsive/home_screen_mobile.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController=TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController: _trackingScrollController,),
          desktop: HomeScreenDesktop(scrollController: _trackingScrollController) ,
          tablet: HomeScreenMobile(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

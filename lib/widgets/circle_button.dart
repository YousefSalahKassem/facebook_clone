import 'package:facebook_clone/constant/constants.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  const CircleButton({Key? key,required this.icon,required this.iconSize, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Constants.third,
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon),iconSize: iconSize,color: Colors.grey[200],),
    );
  }
}

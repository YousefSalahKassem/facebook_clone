import 'package:facebook_clone/constant/constants.dart';
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const PostButton({Key? key,required this.icon,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Constants.secondary,
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(width: 4,),
                  Text(label,style: TextStyle(color: Colors.grey[600]),),
                ],
              ),
            )
        ),
      ),
    );
  }
}

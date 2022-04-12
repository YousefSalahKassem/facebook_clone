import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const Option({Key? key,required this.icon,required this.color,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 30,color: color,),
        const SizedBox(width: 6,),
        Flexible(child: Text(label,style: const TextStyle(fontSize: 16,color: Colors.white),overflow: TextOverflow.ellipsis,))
      ],
    );
  }
}

import 'package:facebook_clone/constant/constants.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: (){},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 3,color: Colors.blueAccent.shade100),
      textColor: Constants.facebookBlue,
      child: Row(
        children: [
          ShaderMask(shaderCallback: (rect)=>Constants.createRoomGradient.createShader(rect),
          child: const Icon(Icons.video_call,size: 35,color: Colors.white,),  
          
          ),
          const SizedBox(width: 4,),
          const Text('Create\nRoom'),
        ],
      ),

        );
  }
}

import 'package:flutter/material.dart';

class Constants {
  static const Color scaffold = Color(0xFF18191a);
  static const Color secondary = Color(0xFF242526);
  static const Color third = Color(0xFF3a3b3c);

  static const Color facebookBlue = Color(0xFF1777F2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
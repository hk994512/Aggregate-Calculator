import 'package:flutter/material.dart';

class UIHelpers {
  static text(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  static image(
    String imagePath, {
    BoxFit? fit,
    Color? color,
    double? height,
    double? width,
  }) {
    return Image.asset(
      imagePath,
      fit: fit,
      color: color,
      height: height,
      width: width,
    );
  }

  static field(String labelText, TextEditingController controller) {
    return Container(
      height: 70,
      width: 317,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff656063)),
        color: Color(0xff656060),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xffFDF7F7)),
        ),
      ),
    );
  }
}

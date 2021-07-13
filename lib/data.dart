import 'package:flutter/material.dart';

buildTextSubTitleVariation1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontFamily: "HellixBold",
        color: Colors.grey,
      ),
    ),
  );
}
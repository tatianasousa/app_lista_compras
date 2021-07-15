import 'package:flutter/material.dart';
import 'layout.dart';
import 'homeList.dart';

class HomePage extends StatelessWidget{
  static String tag = 'home-page';
  
  @override
  Widget build(BuildContext context) {
    final content = HomeList();

    return Layout.getContent(context, content);
  }

  
}
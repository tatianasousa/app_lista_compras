import 'package:flutter/material.dart';
import 'dart:async';

class HomeList extends StatefulWidget {
  static List<Widget> items = [];

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {

    List<Widget> values = [];
    if (HomeList.items.length == 0){
      values.add(ListTile(
        leading: Icon(Icons.pages),
        title: Text('No lists'),
        trailing: Icon(Icons.more_vert),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      children: (HomeList.items.length == 0) ? values : HomeList.items,
    );
  }
}
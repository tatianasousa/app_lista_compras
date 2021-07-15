
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'layout.dart';
import 'list.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes ={
    HomePage.tag: (context) => HomePage(),
    ListPage.tag: (context) => ListPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.black),
          bodyText1: TextStyle(fontSize: 14), 
        ),
      ),
      home: HomePage(),
    );
  }
  
}

class Lista {
  final int id;
  final String nome;

  Lista({
    required this.id,
    required this.nome,
  });

  factory Lista.fromJson(Map<String, dynamic> json) {
    return Lista(
      id: json['id'] as int,
      nome: json['nome'] as String,
    );
  }
}

class Item {
  final int id;
  final String nome;

  Item({
    required this.id,
    required this.nome,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      nome: json['nome'] as String,
    );
  }
}

List<Lista> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Lista>((json) => Lista.fromJson(json)).toList();
}

Future<List<Lista>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:3000/listas'));

  return parsePhotos(response.body);
}
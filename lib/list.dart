import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'layout.dart';

class ListPage extends StatefulWidget {
  static final tag = 'list-page';

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Widget> itemsList = [];

  @override
  void initState(){
    itemsList.add(
      ListTile(
        leading: Icon(Icons.adjust),
        title: Text('Nome do item'),
        trailing: GestureDetector(
          child: Icon(Icons.delete),
          onTap: () {

          },
        ),
      ),

    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final content = SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Pesquisar',
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 300,
          child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, int index){
              return itemsList[index];
            },
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            child: Text('+ Novo item'),
            onPressed: (){
              initState();
            },
          ),
        ),
      ],
      ),
    );

    return Layout.getContent(context, content);
  }
}
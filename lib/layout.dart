import 'package:app_lista_compras/home.dart';
import 'package:flutter/material.dart';
import 'homeList.dart';
import 'list.dart';

final pages = [
  HomePage.tag,
  ListPage.tag,
];
int currItem = 0;
class Layout {
  static Scaffold getContent(BuildContext context, content) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Center(
          child: Text("Lista de Compras"),
        ),
        actions: _getActions(context),
      ),
      body: content,
    );
  }
}

List<Widget> _getActions(BuildContext context) {
  final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blueGrey.shade800));
  List<Widget> items = [];
  if (pages[currItem] != HomePage.tag){
    return items;
  }
  TextEditingController _c = TextEditingController();
  items.add(
    GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {
              final input = TextFormField(
                controller: _c,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
              );

              return AlertDialog(
                title: Text('Nova Lista'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[input],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: style,
                    child: Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async{
                      HomeList.items.add(
                        ListTile(
                          leading: Icon(Icons.pages),
                          title: Text(_c.text),
                          trailing: Icon(Icons.more_vert),
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(ListPage.tag);
                          },
                        ),
                      );

                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pushReplacementNamed(HomePage.tag);
                    },
                  ),
                  ElevatedButton(
                    style: style,
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Icon(Icons.add),
    ),
  );
  
  items.add(Padding(padding: EdgeInsets.only(right: 20)));

  return items;
}

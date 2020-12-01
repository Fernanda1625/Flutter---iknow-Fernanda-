import 'package:flutter/material.dart';
import 'package:iknow/screens/home/components/docs.dart';

class HomeScreen extends StatefulWidget {

  static String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lista de Documentos',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
              title: Text('Lista de Documentos')
          ),
          body: new ListView(
              children: countries.map(_buildItem).toList(),
          )
      )
    );
  }
}

Widget _buildItem(Doc doc) {
  return new ListTile(
      title: new Text(doc.name),
      subtitle: new Text('Documento: ${doc.doc}'),
      trailing: new Text('Fecha: ${doc.fecha}'),
      leading: new Icon(Icons.person),
      onTap: (){
        print(doc.name);
      },
  );
}
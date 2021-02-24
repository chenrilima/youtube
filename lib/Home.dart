import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas =
    [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 140,
          height: 30,
        ),
        actions: [

      IconButton(
      icon: Icon(Icons.search),
      onPressed: () async  {
        String res =  await  showSearch( context: context,  delegate: CustomSearchDelegate());
        setState(() {
          _resultado = res;
        });
      },
      ),


          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("ação: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("ação: pesquisa");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("ação: conta");
            },
          )
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //  backgroundColor: Colors.orange,
              title: Text("Início"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
              title: Text("em Alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
            // backgroundColor: Colors.yellow,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
            // backgroundColor: Colors.purple,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}

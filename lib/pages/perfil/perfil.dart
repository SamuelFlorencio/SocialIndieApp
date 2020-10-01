import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialindiepro_app/pages/perfil/popup_option_config.dart';
import 'package:socialindiepro_app/pages/perfil/portifolioItem.dart';
import 'package:socialindiepro_app/pages/perfil/projetoItem.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with SingleTickerProviderStateMixin {
  //
  final Color purple = Colors.purple[800];
  final Color purpleDark = Colors.purple[900];
  final Color amber = Colors.amber[400];
  final String url =
      'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png';

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    //v controller
    //v controle da aba projetos e portifolio
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //animação do container habilidades

  bool selected = false;

  void _updateState() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Usuarios')
              .doc('idteste') //joao
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            } else {
              Map<String, dynamic> documentFields = snapshot.data.data();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //nome
                  Text(
                    documentFields["userName"],
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            }
          },
        ),
        elevation: 0,
        backgroundColor: purple,
        actions: <Widget>[
          PopupOptionMenu(),
        ],
      ),
      body: ListView(children: <Widget>[
        //vvv Todo o background roxo
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: purple,

          //vvv principal Usuario
          child: Column(
            children: <Widget>[
              //v foto, bio, botoes(menssage e seguir)
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //v foto perfil
                      Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(url),
                        ),
                      ),
                      //v bio
                      Padding(
                        padding: const EdgeInsets.only(right: 70, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //nome do usuario do banco
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Usuarios')
                                  .doc('idteste') //joao
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return new Text("Loading");
                                } else {
                                  Map<String, dynamic> documentFields =
                                      snapshot.data.data();
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //nome
                                      Text(
                                        documentFields["userName"],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      //bio
                                      Text(
                                        documentFields["userBio"],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      //v botoes
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            //v menssagem
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                width: 40,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Icon(Icons.send, color: purple),
                                ),
                              ),
                            ),
                            //v seguir
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                width: 40,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Icon(Icons.person_add, color: purple),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //v habilidades e botao
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.bounceOut,
          width: selected ? 100.0 : 100.0,
          height: selected ? 400.0 : 100.0,
          //height: MediaQuery.of(context).size.width / 3 - 8,
          //height: 148,
          color: purpleDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //v habilidades
              Container(
                // child: Padding(
                // padding:
                //   const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.code, color: Colors.white),
                        Text(
                          'Programador',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.brush, color: Colors.white),
                        Text(
                          'artista',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.music_note, color: Colors.white),
                        Text(
                          'Musico',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //),

              //v botao seta p baixo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              onPressed: () {
                                _updateState();
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //v abas Portfólio e Projetos
        Container(
          decoration: BoxDecoration(
            /*boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                spreadRadius: 1.0,
              ),
            ],*/
            color: purple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          //alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height / 11 + 4,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.white.withOpacity(0.6),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            tabs: <Widget>[
              Tab(text: 'Portfólio'),
              Tab(text: 'Projetos'),
            ],
          ),
        ),
        Container(
          height: 8,
        ),
        //v conteudo Portifolio e projetos

        Container(
          height: MediaQuery.of(context).size.width + 900,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //conteudo Portifolio
              Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    PortifolioItem(),
                    PortifolioItem(),
                    PortifolioItem(),
                    PortifolioItem(),
                    PortifolioItem(),
                  ],
                ),
              ),
              //v conteudo Projetos
              Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    ProjetoItem(),
                    ProjetoItem(),
                    ProjetoItem(),
                    ProjetoItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/controllers/auth/auth_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../core/consts/colors_consts.dart';
import '../../../core/consts/routers_const.dart';
import '../../../interfaces/auth_repository_interface.dart';
import 'popup_add.dart';
import 'popup_option_config.dart';
import 'portifolioItem.dart';
import 'projetoItem.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController>
    with SingleTickerProviderStateMixin {
  final String url =
      'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png';
  AuthController _authController;
  TabController _tabController;
  @override
  void initState() {
    
    //v controller
    //v controle da aba projetos e portifolio
    _tabController = TabController(length: 2, vsync: this);
    _authController = Modular.get<AuthController>();
    super.initState();
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
      floatingActionButton: PopupAdd(),
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Usuarios')
              .doc('idteste') //joao
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
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
        backgroundColor: ColorsConst.primaryColor,
        actions: <Widget>[
          PopupOptionMenu(),
        ],
      ),
      body: ListView(children: <Widget>[
        //v botao de criação

        //vvv Todo o background roxo
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: ColorsConst.primaryColor,

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /* //v menssagem
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                width: 40,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Icon(Icons.send, color: purplePri),
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
                                  child: Icon(
                                    Icons.person_add,
                                    color: purplePri,
                                  ),
                                ),
                              ),
                            ),*/
                            ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor:
                                      ColorsConst.amareloColor, // inkwell color
                                  child: SizedBox(
                                      width: 45,
                                      height: 45,
                                      child: Icon(
                                        Icons.send,
                                        color: ColorsConst.primaryColor,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                              height: 15,
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor:
                                      ColorsConst.amareloColor, // inkwell color
                                  child: SizedBox(
                                      width: 45,
                                      height: 45,
                                      child: Icon(
                                        Icons.person_add,
                                        color: ColorsConst.primaryColor,
                                      )),
                                  onTap: () {},
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
          color: ColorsConst.secundaryColor,
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
            color: ColorsConst.primaryColor,
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
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.star_border),
                      padding: EdgeInsets.all(10),
                    ),
                    Text('Portfólio'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.lightbulb_outline),
                      padding: EdgeInsets.all(10),
                    ),
                    Text('Projetos'),
                  ],
                ),
              ),
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
                  ],
                ),
              ),
              //v conteudo Projetos
              Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
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

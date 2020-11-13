import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socialindiepro_app/app/controllers/auth/auth_controller.dart';
import 'package:socialindiepro_app/app/views/widgets/bottom_navigation_bar.dart';
import '../../../controllers/profile_controller.dart';
import '../../../core/consts/colors_consts.dart';
import '../../../core/consts/routers_const.dart';
import '../../../interfaces/auth_repository_interface.dart';
import 'popup_add.dart';
import 'popup_option_config.dart';
import 'portifolioItem.dart';
import 'projetoItem.dart';

// ignore: lines_longer_than_80_chars

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
  ProfileController profileController = ProfileController();

  bool _program = false;
  bool _art = false;
  bool _music = false;

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

/*
  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot qn = await firestore.collection('portfolios').get();

    return qn.docs;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PopupAdd(),
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser.uid) //joao
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //return Text("Loading");
              return Center(
                child: GlowingProgressIndicator(
                  child: Divider(
                    height: 0,
                    thickness: 20,
                    color: Colors.black.withOpacity(0.2),
                    indent: 10,
                    endIndent: 150,
                  ),
                ),
              );
            } else {
              Map<String, dynamic> documentFields = snapshot.data.data();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  documentFields["name"] == null
                      ? GlowingProgressIndicator(
                          child: Divider(
                            height: 25,
                            thickness: 20,
                            color: Colors.black.withOpacity(0.2),
                            indent: 10,
                            endIndent: 150,
                          ),
                        )
                      :
                      //nome
                      Text(
                          documentFields["name"],
                          style: TextStyle(color: Colors.white),
                        ),
                ],
              );
            }
          },
        ),
        elevation: 0,
        backgroundColor: ColorsConst.primaryColor,
      ),
      endDrawer: Drawer(
        child: ListView(
            padding: EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 40),
            children: [
              Column(
                children: <Widget>[
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser.uid) //joao
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        //return Text("Loading");
                        return Center(
                          child: GlowingProgressIndicator(
                            child: Divider(
                              height: 0,
                              thickness: 20,
                              color: Colors.black.withOpacity(0.2),
                              indent: 10,
                              endIndent: 150,
                            ),
                          ),
                        );
                      } else {
                        Map<String, dynamic> documentFields =
                            snapshot.data.data();
                        return Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: documentFields["name"] == null
                                  ? GlowingProgressIndicator(
                                      child: Divider(
                                        height: 25,
                                        thickness: 20,
                                        color: Colors.black.withOpacity(0.2),
                                        indent: 10,
                                        endIndent: 150,
                                      ),
                                    )
                                  : Text(
                                      documentFields["name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 30,
                    thickness: 2.5,
                    color: Colors.black.withOpacity(0.2),
                    indent: 5,
                    endIndent: 5,
                  ),
                  RaisedButton(
                    shape: Border.all(width: 0, color: Colors.white),
                    elevation: 0,
                    color: Colors.white,
                    onPressed: profileController.doOpenEditProfile,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.settings, color: Colors.black87),
                          ),
                          Text(
                            'Editar Perfil',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: Border.all(width: 0, color: Colors.white),
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.bookmark, color: Colors.black87),
                          ),
                          Text(
                            'Salvos',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: Border.all(width: 0, color: Colors.white),
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.settings_backup_restore,
                                color: Colors.black87),
                          ),
                          Text(
                            'Arquivados',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: Border.all(width: 0, color: Colors.white),
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.settings, color: Colors.black87),
                          ),
                          Text(
                            'Configurações',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 2.5,
                    color: Colors.black.withOpacity(0.2),
                    indent: 5,
                    endIndent: 5,
                  ),
                  RaisedButton(
                    shape: Border.all(width: 0, color: Colors.white),
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {
                      _authController.doLogout();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child:
                                Icon(Icons.exit_to_app, color: Colors.black54),
                          ),
                          Text(
                            'Sair',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
          child: Column(
        children: [
          /* shrinkWrap: true, children: <Widget>[ */

          //v botao de criação

          //vvv Todo o background roxo
          Wrap(
              /*   width: MediaQuery.of(context).size.width,
          height: 200,
          color: ColorsConst.primaryColor, */

              //vvv principal Usuario

              children: [
                Container(
                  color: ColorsConst.primaryColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    //width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        //mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset: Offset(0, 10))
                                                ],
                                                shape: BoxShape.circle,
                                                color: ColorsConst.amareloColor,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          StreamBuilder<
                                                              DocumentSnapshot>(
                                                            stream: FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'users')
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    .uid) //joao
                                                                .snapshots(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (!snapshot
                                                                  .hasData) {
                                                                //return Text("Loading");
                                                                return Center(
                                                                  child:
                                                                      GlowingProgressIndicator(
                                                                    child:
                                                                        Divider(
                                                                      height: 0,
                                                                      thickness:
                                                                          20,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.2),
                                                                      indent:
                                                                          10,
                                                                      endIndent:
                                                                          150,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                Map<String,
                                                                        dynamic>
                                                                    documentFields =
                                                                    snapshot
                                                                        .data
                                                                        .data();
                                                                return Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    //nome
                                                                    documentFields["userFollowers"] ==
                                                                            null
                                                                        ? Text(
                                                                            '0',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          )
                                                                        : Text(
                                                                            documentFields["userFollowers"],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          ),
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            'seguidores',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          StreamBuilder<
                                                              DocumentSnapshot>(
                                                            stream: FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'users')
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    .uid) //joao
                                                                .snapshots(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (!snapshot
                                                                  .hasData) {
                                                                //return Text("Loading");
                                                                return Center(
                                                                  child:
                                                                      GlowingProgressIndicator(
                                                                    child:
                                                                        Divider(
                                                                      height: 0,
                                                                      thickness:
                                                                          20,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.2),
                                                                      indent:
                                                                          10,
                                                                      endIndent:
                                                                          150,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                Map<String,
                                                                        dynamic>
                                                                    documentFields =
                                                                    snapshot
                                                                        .data
                                                                        .data();
                                                                return Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    //nome
                                                                    documentFields["userFollows"] ==
                                                                            null
                                                                        ? Text(
                                                                            '0',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          )
                                                                        : Text(
                                                                            documentFields["userFollows"],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          ),
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            'seguindo',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          StreamBuilder<
                                                              DocumentSnapshot>(
                                                            stream: FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'users')
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    .uid) //joao
                                                                .snapshots(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (!snapshot
                                                                  .hasData) {
                                                                //return Text("Loading");
                                                                return Center(
                                                                  child:
                                                                      GlowingProgressIndicator(
                                                                    child:
                                                                        Divider(
                                                                      height: 0,
                                                                      thickness:
                                                                          20,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.2),
                                                                      indent:
                                                                          10,
                                                                      endIndent:
                                                                          150,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                Map<String,
                                                                        dynamic>
                                                                    documentFields =
                                                                    snapshot
                                                                        .data
                                                                        .data();
                                                                return Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    //nome
                                                                    documentFields["userLikes"] ==
                                                                            null
                                                                        ? Text(
                                                                            '0',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          )
                                                                        : Text(
                                                                            documentFields["userLikes"],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                            ),
                                                                          ),
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            'likes',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              //v botoes
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          elevation: 0,
                                          color: Colors.white,
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.send,
                                            color: ColorsConst.primaryColor,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          elevation: 0,
                                          color: Colors.white,
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.person_add,
                                            color: ColorsConst.primaryColor,
                                          )),
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
              ]

              /*   child: Column(
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
                                  .collection('users')
                                  .doc(FirebaseAuth
                                      .instance.currentUser.uid) //joao
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
                      ),/*
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
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
            ),*/
              ),
          Container(
            color: ColorsConst.primaryColor,
            child: Expanded(
              child: Wrap(
                children: [
                  Container(
                    /* width: 350,
                                    height: 80, */
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth
                                    .instance.currentUser.uid) //joao
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                //return Text("Loading");
                                return Center(
                                  child: GlowingProgressIndicator(
                                    child: Divider(
                                      height: 25,
                                      thickness: 20,
                                      color: Colors.black.withOpacity(0.2),
                                      indent: 10,
                                      endIndent: 150,
                                    ),
                                  ),
                                );
                              } else {
                                Map<String, dynamic> documentFields =
                                    snapshot.data.data();
                                return Container(
                                  color: ColorsConst.primaryColor,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //nome
                                      documentFields["userName"] == null
                                          ? Container(
                                              height: 0,
                                            )
                                          : Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    documentFields["userName"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      documentFields["userBio"] == null
                                          ? Container(
                                              height: 0,
                                            )
                                          : Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    documentFields["userBio"],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: ColorsConst.primaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: ColorsConst.primaryColor,
                    child: Divider(
                      height: 20,
                      thickness: 2.5,
                      color: Colors.black.withOpacity(0.3),
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                ),

                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser.uid) //joao
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      //return Text("Loading");
                      return Container(
                        height: 20,
                        child: GlowingProgressIndicator(
                          child: Divider(
                            height: 0,
                            thickness: 20,
                            color: Colors.black.withOpacity(0.2),
                            indent: 10,
                            endIndent: 150,
                          ),
                        ),
                      );
                    } else {
                      Map<String, dynamic> documentFields =
                          snapshot.data.data();
                      if (documentFields["userAbilMusic"] != true &&
                          documentFields["userAbilArt"] != true &&
                          documentFields["userAbilPrograming"] != true) {
                        return Container(
                          height: 0,
                        );
                      } else {
                        if (documentFields["userAbilMusic"] == null ||
                            documentFields["userAbilMusic"] == false) {
                          _music = false;
                        } else {
                          _music = true;
                        }
                        if (documentFields["userAbilArt"] == null ||
                            documentFields["userAbilArt"] == false) {
                          _art = false;
                        } else {
                          _art = true;
                        }
                        if (documentFields["userAbilPrograming"] == null ||
                            documentFields["userAbilPrograming"] == false) {
                          _program = false;
                        } else {
                          _program = true;
                        }

                        //v habilidades e botao
                        return Container(
                          height: 50,

                          padding: EdgeInsets.only(right: 30, left: 30),
                          // child: Padding(
                          // padding:
                          //   const EdgeInsets.all(0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Visibility(
                                visible: _art,
                                child: Habilidades(
                                  title: 'ARTE VISUAL',
                                  icon: Icons.brush,
                                ),
                              ),
                              Visibility(
                                visible: _program,
                                child: Habilidades(
                                  title: 'PROGRAMAÇÃO',
                                  icon: Icons.code,
                                ),
                              ),
                              Visibility(
                                visible: _music,
                                child: Habilidades(
                                  title: 'MÚSICA',
                                  icon: Icons.music_note,
                                ),
                              ),
                            ],
                          ),
                          /*  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Visibility(
                              visible: true,
                              child: Habilidades(
                                title: 'PROGRAMAÇÃO',
                                icon: Icons.code,
                              ),
                            ),
                            /* Habilidades(
                          title: 'PROGRAMAÇÃO',
                          icon: Icons.code,
                        ), */
                            Habilidades(
                              title: 'ARTE VISUAL',
                              icon: Icons.brush,
                            ),
                            Habilidades(
                              title: 'MÚSICA',
                              icon: Icons.music_note,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), */
                        );
                      }
                    }
                  },
                ),

                //v botao seta p baixo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /* IconButton(
              
               /*  icon: Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.black.withOpacity(0.3),
                ), */
                onPressed: profileController.doOpenAbout,
                
                  //_updateState();
                )    */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    height: 40,
                    width: 350,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black26, width: 2.5)),
                      elevation: 0,
                      color: ColorsConst.primaryColor,
                      onPressed: profileController.doOpenAbout,
                      child: Text(
                        'Sobre',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //v abas Portfólio e Projetos
          Container(
            margin: EdgeInsets.only(bottom: 10),

            decoration: BoxDecoration(
              /*    boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 0.1,
                    offset: Offset(0, 10),
                    color: Colors.black26),
              ], */
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
              labelColor: Colors.white,
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
/*
        Container(
          alignment: Alignment.topLeft,
          child: Wrap(children: [
            ProjetoItem(),
             ProjetoItem(),
          ]),
        )*/
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('portfolios')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            padding: EdgeInsets.all(4),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4),
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.docs[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                shadowColor: Colors.black54,
                                color: ColorsConst.amareloColor,
                                elevation: 5,
                                child: GestureDetector(
                                  onTap: () {},
                                  onLongPress: () {},
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            padding: EdgeInsets.all(1),
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(url),
                                              loadingBuilder:
                                                  (context, child, progress) {
                                                return progress == null
                                                    ? child
                                                    : LinearProgressIndicator();
                                              },
                                            ),
                                            color: ColorsConst.amareloColor,
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(documentSnapshot
                                                .data()['title']),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
                      ProjetoItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /*
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
        ),*/
          // ]
        ],
      )),
    );
  }
}

class Habilidades extends StatelessWidget {
  final String title;
  var icon;

  Habilidades({
    @required this.title,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(icon, color: Colors.white),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

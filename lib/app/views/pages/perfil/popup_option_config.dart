import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socialindiepro_app/app/core/consts/colors_consts.dart';
import '../../../controllers/auth/auth_controller.dart';
import 'widgets/popup_constrants_widget.dart';

class PopupOptionMenu extends StatefulWidget {
  PopupOptionMenu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PopupOptionMenuState createState() => _PopupOptionMenuState();
}

class _PopupOptionMenuState extends State<PopupOptionMenu> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: choiceAction,
      itemBuilder: (context) {
        return PopupConstrantsWidget.choices.map((choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  void choiceAction(String choice) {
    if (choice == PopupConstrantsWidget.settings) {
      /*  showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            child: Text(
                              documentFields["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                content: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: RaisedButton(
                          shape: Border.all(width: 3, color: Colors.black26),
                          elevation: 0,
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            'Editar Perfil',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: RaisedButton(
                          shape: Border.all(width: 3, color: Colors.black26),
                          elevation: 0,
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            'Arquivar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: RaisedButton(
                          shape: Border.all(width: 3, color: Colors.black26),
                          elevation: 0,
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            'Salvos',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: RaisedButton(
                          shape: Border.all(width: 3, color: Colors.black26),
                          elevation: 0,
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            'Configurações',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  RaisedButton(
                    child: Text('oi'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
 */
     ClipPath(child: Drawer(),);
      print('Settings');
    } else if (choice == PopupConstrantsWidget.subscribe) {
      print('Subscribe');
    } else if (choice == PopupConstrantsWidget.signOut) {
      _authController.doLogout();
      print('Sair');
    }
  }
}

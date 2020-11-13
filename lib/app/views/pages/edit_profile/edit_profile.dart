import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socialindiepro_app/app/controllers/auth/auth_controller.dart';
import 'package:socialindiepro_app/app/controllers/profile_controller.dart';
import 'package:socialindiepro_app/app/core/consts/colors_consts.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: "Setting UI",
      home: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfile> {
  ProfileController _profileController = ProfileController();
  // final _txEdCt = TextEditingController(text: 'testandooo');

  @override
  void initState() {
    _profileController = ProfileController();

    super.initState();
  }

  @override
  void dispose() {
    // _txEdCt.dispose();
    super.dispose();
  }

  /* readData() async {
    var documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);
    documentReference.get().then((datasnapshot) async {
      name = await datasnapshot.data()['name'];
      userName = await datasnapshot.data()['userName'];
      userBio = await datasnapshot.data()['userBio'];
      /* datasnapshot.data()['userBio'] == null
          ? readData() 
          : print('EditProfile data Carregado');  */
    });
  }

  String name;
  String userName;
  String userBio; */
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.3),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Editar Perfil",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        /* actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: ColorsConst.primaryColor,
            ),
            onPressed: () {
             /*  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage())); */
            },
          ),
        ], */
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png',
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: ColorsConst.primaryColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              /*        Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextFormField(
                  initialValue: userBio == null ? readData() : '$name',
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "Nome completo",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      // hintText: placeholder,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ), */
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
                    Map<String, dynamic> documentFields = snapshot.data.data();
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: TextFormField(
                            initialValue: documentFields['name'],
                            onChanged: _profileController.setNameData,
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "Nome completo",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                // hintText: placeholder,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: TextFormField(
                            initialValue: documentFields['userName'],

                            /*   onChanged: (text) {
                          if (text.isEmpty) {
                            String userName = documentFields['userName'];
                            _profileController
                                .setUserNameData(userName);
                            print('vaziu');
                          } else {
                            _profileController.setUserNameData;
                            print(text);
                          }
                        }, */
                            onChanged: _profileController.setUserNameData,
                            validator: (text) {},
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "Nome de usuário",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                // hintText: placeholder,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: TextFormField(
                            initialValue: documentFields['userBio'],
                            /*    onChanged: (text) {
                          if (text.isEmpty) {
                            String bio = documentFields['userBio'];
                            _profileController.setUserBioData(bio);
                            print('vaziu');
                          } else {
                            _profileController.setUserBioData;
                            print(text);
                          }
                        }, */
                            onChanged: _profileController.setUserBioData,
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "Bio",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                // hintText: placeholder,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              /*  buildTextField(name, "Nome completo", false),
              buildTextField(userName, "Nome de usuário", false),
              buildTextField(userBio, "Bio", false),  */
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => Navigator.pop(context),
                      child: Text("CANCELAR",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0,
                              color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed: _profileController.doUpdate,
                      color: ColorsConst.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "SALVAR",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*  Widget buildTextField(
      String initial, String labelText, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        onChanged: _profileController.setNameData,
        initialValue: initial,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }*/

}

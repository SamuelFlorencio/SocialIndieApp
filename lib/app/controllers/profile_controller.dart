import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/controllers/getUserCurrentUid.dart';
import 'package:socialindiepro_app/app/interfaces/auth_repository_interface.dart';
import 'package:socialindiepro_app/app/models/user_models/user_model.dart';
import 'package:socialindiepro_app/app/repositories/register_repository.dart';
import 'package:socialindiepro_app/app/repositories/update_repository.dart';

import '../core/consts/routers_const.dart';

class ProfileController {
  String _skill;

  String _name;
  String _userName;
  String _userBio;
  UpdateRepository updateRepository = UpdateRepository();

  //UserModel _userModel = UserModel();
  var mapUserData;
  FirebaseAuth _firebaseAuth;
  //GetUserCurrentUid getUserCurrentUid;

  Future userDataCredencials() async {
    User user;

    var repository = Modular.get();
    var response2 = await repository.getUser();
    user = response2.object;
    // print(user.uid);
    //return user.uid;

    if (user != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      mapUserData = documentReference.get();
      print(mapUserData);
      // UserModel.fromMap();
      return mapUserData;
    } else {
      print('nao funfo o profile controller');
    }
  }

  void doCreateProject() {
    Modular.to.pushNamed(RoutersConst.createProject);
  }

  void doOpenAbout() {
    Modular.to.pushNamed(RoutersConst.about);
  }

  void doOpenEditProfile() {
    Modular.to.pushNamed(RoutersConst.editProfile);
  }

  User user;
  Map<String, dynamic> documentFields;

  Future<String> currentUserUID() async {
    IauthRepository repository = Modular.get();
    var response = await repository.getUser();
    user = response.object;
    print(user.uid);
    return user?.uid;
  }

  Future<StreamBuilder> streamBuilder() async {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid) //joao
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading");
          } else {
            documentFields = snapshot.data.data();
          }
        });
  }

//vvv editProfile Page vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  Future<void> doUpdate() async {
    var userData = <String, dynamic>{
      "name": _name,
      "userName": _userName,
      "userBio": _userBio,
    };

    await updateRepository.updateUserData(userData);
  }

  void setNameData(String name) async {
    _name = name;
    print('$name ooooooooooooooooooooooooooooooooooooooo');
  }

  void setUserNameData(String userName) async {
    _userName = userName;
    print(_userName);
  }

  void setUserBioData(String userBio) async {
    _userBio = userBio;
    print(_userBio);
  }

  //vvv aboutProfile page vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  Future<void> doSkillInsert() async {
   /*  var userSkill = <String, dynamic>{
      "userAbilities": _skill,
      
    }; */

    await updateRepository.insertUserSkill(_skill);
  }

  void setSkillData(String skill) async {
    _skill = skill;
    print('$skill ooooooooooooooooooooooooooooooooooooooo');
  }
}

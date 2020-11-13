import 'package:cloud_firestore/cloud_firestore.dart';
import '../base_model.dart';

class UserModel extends BaseModel {
  String name;
  String userName;
  String userEmail;
  String userPassword;
  String userBio = '';
  int userFollowers = 0;
  int userFollows = 0;
  int userProjects = 0;
  int userLikes = 0;
  String userPhotoUrl;

  bool userAbilPrograming = false;
  bool userAbilMusic = false;
  bool userAbilArt = false;

  UserModel(
      {this.name,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userBio,
      this.userFollowers,
      this.userProjects,
      this.userAbilArt,
      this.userAbilMusic,
      this.userAbilPrograming,
      this.userPhotoUrl,
      this.userFollows,
      this.userLikes});

  UserModel.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    name = document.data()['name'];
    userName = document.data()['userName'];
    userEmail = document.data()['userEmail'];
    userPassword = document.data()['userPassword'];
    userBio = document.data()['userBio'];
    userFollowers = document.data()['userFollowers'];
    userProjects = document.data()['userProjects'];
    userAbilArt = document.data()['userAbilArt'];
    userAbilMusic = document.data()['userAbilMusic'];
    userAbilPrograming = document.data()['userAbilPrograming'];
    userPhotoUrl = document.data()['userPhotoUrl'];
    userFollows = document.data()['userFollows'];
    userLikes = document.data()['userLikes'];
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['userName'] = userName;
    map['userEmail'] = userEmail;
    map['userPassword'] = userPassword;
    map['userBio'] = userBio;
    map['userFollowers'] = userFollowers;
    map['userProjects'] = userProjects;
    map['userAbilArt'] = userAbilArt;
    map['userAbilMusic'] = userAbilMusic;
    map['userAbilPrograming'] = userAbilPrograming;
    map['userPhotoUrl'] = userPhotoUrl;
    map['userFollows'] = userFollows;
    map['userLikes'] = userLikes;
    return map;
  }

  String get getName => name;

  Future<void> setName(String name) async => this.name = name;

  String get getUserName => userName;

  Future<void> setUserName(String userName) async => this.userName = userName;

  String get getUserEmail => userEmail;

  set setUserEmail(String userEmail) => this.userEmail = userEmail;

  String get getUserPassword => userPassword;

  set setUserPassword(String userPassword) => this.userPassword = userPassword;

  String get getUserBio => userBio;

  set setUserBio(String userBio) => this.userBio = userBio;

  int get getUserFollowers => userFollowers;

  set setUserFollowers(int userFollowers) => this.userFollowers = userFollowers;

  int get getUserProjects => userProjects;

  set setUserProjects(int userProjects) => this.userProjects = userProjects;

  String get getUserPhotoUrl => userPhotoUrl;

  set setUserPhotoUrl(String userPhotoUrl) => this.userPhotoUrl = userPhotoUrl;

  bool get getUserAbilPrograming => userAbilPrograming;

  set setUserAbilPrograming(bool userAbilPrograming) =>
      this.userAbilPrograming = userAbilPrograming;

  bool get getUserAbilMusic => userAbilMusic;

  set setUserAbilMusic(bool userAbilMusic) =>
      this.userAbilMusic = userAbilMusic;

  bool get getUserAbilArt => userAbilArt;

  set setUserAbilArt(bool userAbilArt) => this.userAbilArt = userAbilArt;

  int get getUserFollows => userFollows;

  set setUserFollows(int userFollows) => this.userFollows = userFollows;

  int get getUserLikes => userLikes;

  set setUserLikes(int userLikes) => this.userLikes = userLikes;
}

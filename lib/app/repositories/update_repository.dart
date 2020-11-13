import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/errors/register_error_interceptor.dart';
import '../core/responses/response_builder.dart';
import '../core/responses/response_defult.dart';
import '../interfaces/auth_repository_interface.dart';

class UpdateRepository {
  //@override
  Future<DefaultResponse> updateUserData(Map mapUser) async {
    IauthRepository repository = Modular.get();
    var response2 = await repository.getUser();
    User user = response2.object;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(user.uid);
    print(mapUser);

    // try {
    if (mapUser['userName'] != null) {
      await documentReference
          .update({'userName': mapUser['userName']})
          .whenComplete(() {})
          .then(
            (update) {
              print('user name Atualizado com sucessoooooooooooooo');
            },
          );
    }

    if (mapUser['name'] != null) {
      await documentReference
          .update({'name': mapUser['name']})
          .whenComplete(() {})
          .then(
            (update) {
              print('name Atualizado com sucessoooooooooooooo');
            },
          );
    }

    if (mapUser['userBio'] != null) {
      await documentReference
          .update({'userBio': mapUser['userBio']})
          .whenComplete(() {})
          .then(
            (update) {
              print('bio Atualizado com sucessoooooooooooooo');
            },
          );
    }
    /*  } catch (e) {
      ResponseBuilder.failed(
          object: e,
          message: e.code,
          errorInterceptor: RegisterErrorInterceptor());
    } */

/* 
    updateUserName() async {
      // if (mapUser['userName'] != null) {
      try {
        await documentReference
            .update({'userName': mapUser['userName']})
            .whenComplete(() {})
            .then(
              (update) {
                print('user name Atualizado com sucessoooooooooooooo');
              },
            );
      } catch (e) {
        ResponseBuilder.failed(
            object: e,
            message: e.code,
            errorInterceptor: RegisterErrorInterceptor());
      }
      //}
    }

    updateName() async {
      //if (mapUser['name'] != null) {
      try {
        await documentReference
            .update({'name': mapUser['name']})
            .whenComplete(() {})
            .then(
              (update) {
                print('name Atualizado com sucessoooooooooooooo');
              },
            );
      } catch (e) {
        ResponseBuilder.failed(
            object: e,
            message: e.code,
            errorInterceptor: RegisterErrorInterceptor());
      }
      //}
    }

    updateBio() async {
      //if (mapUser['userBio'] != null) {
      try {
        await documentReference
            .update({'userBio': mapUser['userBio']})
            .whenComplete(() {})
            .then(
              (update) {
                print('bio Atualizado com sucessoooooooooooooo');
              },
            );
      } catch (e) {
        ResponseBuilder.failed(
            object: e,
            message: e.code,
            errorInterceptor: RegisterErrorInterceptor());
      }
      //}
    } */
  }

  Future<DefaultResponse> insertUserSkill(var userSkill) async {
    IauthRepository repository = Modular.get();
    var response2 = await repository.getUser();
    User user = response2.object;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(user.uid);
    print(userSkill);

    // try {
    if (userSkill != null) {
      await documentReference
          .update({'userAbilities': FieldValue.arrayUnion([userSkill])})
          .whenComplete(() {})
          .then(
            (update) {
              print('user skill Inserido com sucessoooooooooooooo');
            },
          );
    }
  }
}

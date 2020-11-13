import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialindiepro_app/app/models/user_models/user_model.dart';
import '../core/errors/register_error_interceptor.dart';
import '../core/responses/response_builder.dart';
import '../core/responses/response_defult.dart';
import '../interfaces/auth_repository_interface.dart';

class AuthRepository implements IauthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return ResponseBuilder.success<User>(
          //modificado
          object: await firebaseAuth.currentUser);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      var googleSignIn = GoogleSignIn();

      var googleSignInAccount = await googleSignIn.signIn();

      var googleSignInAuthentication = await googleSignInAccount.authentication;

      User firebaseUser; //modificado

      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user;
        });
      }
      return ResponseBuilder.success<User>(
          object: firebaseUser, message: 'Logou com sucesso');
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(
          object: e, message: 'Falha ao Logar com Google. e: ${e.toString()}');
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<User>(
          object: await firebaseAuth.currentUser);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
        (auth) {
          return ResponseBuilder.success<User>(object: auth.user);
        },
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.code,
          errorInterceptor: RegisterErrorInterceptor());
    }
  }


}

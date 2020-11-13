import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/errors/register_error_interceptor.dart';
import '../core/responses/response_builder.dart';
import '../core/responses/response_defult.dart';
import '../interfaces/auth_repository_interface.dart';

class RegisterRepository{


  //@override
  Future<DefaultResponse> registerUserData(Map mapUser) async {
    IauthRepository repository = Modular.get();
    var response2 = await repository.getUser();
    User user = response2.object;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(user.uid);

    print(mapUser);

    try {
      return await documentReference.set(mapUser).whenComplete(() {}).then(
        (register) {
          print('deu certooooooo');
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

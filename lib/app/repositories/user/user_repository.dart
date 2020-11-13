import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_models/user_model.dart';
import '../firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<UserModel> {
  // ignore: lines_longer_than_80_chars
  //vvv cria um banco com o nome da callection como users (está desativado pois em "firebase_repository_base" ja cria a collection com o nome da model)
  /*@override
  String get collection => 'users';*/

  @override
  UserModel Function(DocumentSnapshot document) get fromMap =>
      (document) => UserModel.fromMap(document);
}

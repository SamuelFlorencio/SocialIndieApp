import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/interfaces/auth_repository_interface.dart';

import '../interfaces/firebase_repository_base_interface.dart';
import '../models/base_model.dart';

class FirebaseRepositoyBase<Model extends BaseModel>
    implements IFirebaseRepositoryBaseInterface<Model> {
  FirebaseRepositoyBase({this.fromMap, this.collection}) {
    // ignore: lines_longer_than_80_chars
    //v cria collection com o nome da model deixando tudo em minusculo e acrescenta 's' no final
    collection ?? '${Model.toString().toLowerCase()}s';
    collectionReference = FirebaseFirestore.instance.collection(collection);
  }

  final Model Function(DocumentSnapshot document) fromMap;

  String collection;

  CollectionReference collectionReference;

  @override
  Future<String> add(Model model) async {
    model.setCreateTime();
    model.setUpdateTime();
    var collection = collectionReference;
    var document = await collection.add(model.toMap());
    return document.id;
  }

  @override
  Future<void> update(Model model) async {
    model.setUpdateTime();
    var collection = collectionReference;
    await collection.doc(model.documentId()).update(model.toMap());
  }

  @override
  Future<void> disable(Model model) async {
    model.disableDocument();
    update(model);
  }

  @override
  Future<void> enable(Model model) async {
    model.enableDocument();
    update(model);
  }

  @override
  Future<void> delete(String documentId) async {
    var collection = collectionReference;
    await collection.doc(documentId).delete();
  }

  @override
  Future<Model> getById(String documentId) async {
    var collection = collectionReference;
    var snapshot = await collection.doc(documentId).get();
    return fromMap(snapshot);
  }

  @override
  Future<List<Model>> getAll() async {
    var collection = collectionReference;
    // ignore: lines_longer_than_80_chars
    //List<Model> list = []; versao origial da linha de baixo, se der erro apague a linha de baixo
    var list = <Model>[];
    var querySnapshot = await collection.get();
    await querySnapshot.docs.forEach((element) {
      list.add(fromMap(element));
    });

    return await list;
  }

  @override
  CollectionReference filter() {
    return collectionReference;
  }

  @override
  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentList) {
    List<Model> list = [];
    documentList.forEach((element) {
      list.add(fromMap(element));
    });
    return list;
  }

 
/*
 
    User userData = await _firebaseAuth.currentUser;

    user = userData;
    print(userData.uid);
    print('foiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii 1');
    return userData.uid;
*/

    /* String userName = "samuel";
    IauthRepository repository = Modular.get();
    var response2 = await repository.getUser();
    User user = response2.object;
    print(user.uid);
    print('criadooooooooooooooooooooooooooooooooooooooo');
   DocumentReference documentReference = 
    FirebaseFirestore.instance.collection("users").doc(user.uid);
    Map<String, dynamic> mapusers = {
      "userName": userName,
    };
    documentReference.set(mapusers).whenComplete(() {
      print("$userName bancooooo    criadoooooooooooooooooooooooooooooooo");
    });*/
  
}

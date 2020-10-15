import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

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
    List<Model> list = [];
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
}

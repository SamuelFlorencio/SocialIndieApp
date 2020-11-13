import 'package:cloud_firestore/cloud_firestore.dart';
import '../base_model.dart';

class ProjectModel extends BaseModel {
 

  String projetoNome;
  String projetoDescricao;
  // projetoThumbnail;
  bool projetoCategoriaProg;
  bool projetoCategoriaArt;
  bool projetoCategoriaMusic;
  int projetoQuantLikes;
  int projetoQuantComents;
  Timestamp projetoCreatedAt;
  Timestamp projetoUpdateAt;
  bool projetoPrivacidade;
  bool projetoTranca;
  String projetoTags;
  String fkProjetoUpdateId;

ProjectModel({this.projetoNome, this.projetoDescricao,});

  ProjectModel.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    projetoNome = document.data()["projetoNome"];
    projetoDescricao = document.data()["projetoDescricao"];
   
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['projetoNome'] = projetoNome;
    map['projetoDescricao'] = projetoDescricao;

    return map;
  }


}

//import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioModel  {
  String nome;
  String email;
  String senha;
  String bio;
  int seguidores;
  int projetos;

  bool habilProgramador;
  bool habilMusico;
  bool habilEscritor;
  bool habilArtista;


  UsuarioModel({
    this.nome,
    this.email,
    this.senha,
    this.bio,
    this.seguidores,
    this.projetos,
    this.habilArtista,
    this.habilEscritor,
    this.habilMusico,
    this.habilProgramador,
  });
/*
  UsuarioModel.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    nome = document.data()["nome"];
    email = document.data()['email'];
    senha = document.data()['senha'];
    bio = document.data()['bio'];
    seguidores = document.data()['seguidores'];
    projetos = document.data()['projetos'];
    habilArtista = document.data()['habilArtista'];
    habilEscritor = document.data()['habilEscritor'];
    habilMusico = document.data()['habilMusico'];
    habilProgramador = document.data()['habilProgramador'];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map['nome'] = nome;
    map['email'] = email;
    map['senha'] = senha;
    map['bio'] = bio;
    map['seguidores'] = seguidores;
    map['projetos'] = projetos;
    map['habilArtista'] = habilArtista;
    map['habilEscritor'] = habilEscritor;
    map['habilMusico'] = habilMusico;
    map['habilProgramador'] = habilProgramador;
    return map;
  }


  String get getNome => nome;

  set setNome(String nome) => this.nome = nome;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  String get getSenha => senha;

  set setSenha(String senha) => this.senha = senha;

  String get getBio => bio;

  set setBio(String bio) => this.bio = bio;

  int get getSeguidores => seguidores;

  set setSeguidores(int seguidores) => this.seguidores = seguidores;

  int get getProjetos => projetos;

  set setProjetos(int projetos) => this.projetos = projetos;

  bool get getHabilProgramador => habilProgramador;

  set setHabilProgramador(bool habilProgramador) =>
      this.habilProgramador = habilProgramador;

  bool get getHabilMusico => habilMusico;

  set setHabilMusico(bool habilMusico) => this.habilMusico = habilMusico;

  bool get getHabilEscritor => habilEscritor;

  set setHabilEscritor(bool habilEscritor) =>
      this.habilEscritor = habilEscritor;

  bool get getHabilArtista => habilArtista;

  set setHabilArtista(bool habilArtista) => this.habilArtista = habilArtista;


*/
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //model
  String userId, userName, userEmail, userSenha;

  getUserId(id) {
    this.userId = id;
  }

  getUserName(name) {
    this.userName = name;
  }

  getUserEmail(email) {
    this.userEmail = email;
  }

  getUserSenha(senha) {
    this.userSenha = senha;
  }

  //DAO

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Usuarios").doc(userId);

    Map<String, dynamic> usuarios = {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userSenha': userSenha
    };

    documentReference.set(usuarios).whenComplete(
          () => print('$userName CREATED'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'personId',
                  fillColor: Colors.amber,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String id) {
                  getUserId(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  fillColor: Colors.amber,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String name) {
                  getUserName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.amber,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String email) {
                  getUserEmail(email);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  fillColor: Colors.amber,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String senha) {
                  getUserSenha(senha);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('Criar'),
                    textColor: Colors.white,
                    onPressed: () {
                      createData();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

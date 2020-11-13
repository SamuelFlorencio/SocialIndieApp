/*//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../interfaces/auth_repository_interface.dart';
import 'package:socialindiepro_app/app/models/usuario_models/usuario_model.dart';
import 'package:socialindiepro_app/app/repositories/user_repository.dart';
//import 'package:socialindiepro_app/app/controllers/auth/auth_controller.dart';
import '../../../../core/enums/app_enums.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
/*   //model
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
  }*/
/*
  //DAO

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Users").doc(userId);

    Map<String, dynamic> users = {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userSenha': userSenha
    };

    documentReference.set(users).whenComplete(
          () => print('$userName CREATED'),
        );
  }
*/ /*
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }*/

  UserRepository userRepository;
  String id;
  //@override
  //void initState() {}
  UserModel usermodel = UserModel();

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
                  //   getUserId(id);
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
                  //getUserName(name);
                  //UserModel(nome: name);
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
                  //getUserEmail(email);
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
                  //getUserSenha(senha);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('Criar'),
                    textColor: Colors.white,
                    onPressed: () async {
                      var user = UserModel(
                        nome: 'name',
                        email: 'email',
                        senha: 'senha',
                        bio: null,
                        seguidores: null,
                        projetos: null,
                        photoUrl: null,
                        habilProgramador: null,
                        habilMusico: null,
                        habilEscritor: null,
                        habilArtista: null,
                      );
                      id = await userRepository.add(user);
                    },
                  ),
                  RaisedButton(
                      child: Text('Login Google'),
                      onPressed: () async {
                        await Modular.get<IAuthRepository>()
                            .doLoginGoogle()
                            .then((result) {
                          if (result.success) {
                            print(result.message);
                          } else {
                            print(result.message);
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/controllers/register/register_controller.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../widgets/scroll_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController _authController;
  RegisterController _registerController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    _registerController = Modular.get<RegisterController>();
    super.initState();
  }

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validado");
    } else {
      print("Não validado");
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("NOVA CONTA"),
      ),
      body: ScrollWidget(
        key: formkey,
        children: <Widget>[
          TextFormField(
            onChanged: _authController.setEmail,
            decoration: InputDecoration(labelText: "Seu email"),
            validator: (val) => val.isEmpty || !val.contains("@")
                ? "Este email não é válido"
                : null,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextFormField(
            onChanged: _authController.setPassword,
            decoration: InputDecoration(labelText: "Sua senha"),
            validator: (value) {
              if (value.isEmpty) {
                return "Campo obrigatório";
              } else {
                return null;
              }
            },
            //obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextFormField(
            onChanged: _authController.setNameData,
            decoration: InputDecoration(labelText: "Nome completo"),
            validator: (value) {
              if (value.isEmpty) {
                return "Campo obrigatório";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextFormField(
            onChanged: _authController.setUserNameData,
            decoration: InputDecoration(labelText: "Nome de usuario"),
            validator: (value) {
              if (value.isEmpty) {
                return "Campo obrigatório";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          Observer(builder: (context) {
            return RaisedButton(
              onPressed: _authController.enableButton
                  ? () async {
                      validate;
                      await _authController.doRegister().catchError(
                        (error) {
                          var scnackbar = SnackBar(
                            content: Text(error.message),
                          );
                          Scaffold.of(context).showSnackBar(scnackbar);
                        },
                      );
                    }
                  : null,
              child: Text(
                "CADASTRE-SE",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ],
      ),
    );
  }
}

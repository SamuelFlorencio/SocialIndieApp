import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../core/consts/colors_consts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.spa, color: ColorsConst.secundaryColor),
                    Text(
                      ' SocialIndiePro',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: ColorsConst.secundaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  height: MediaQuery.of(context).size.height - 196,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Entrar',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                            ),
                          ],
                        ),
                        TextField(
                          onChanged: _authController.setEmail,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          onChanged: _authController.setPassword,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: ColorsConst.secundaryColor,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            
                            color: ColorsConst.primaryColor,
                            onPressed: _authController.doLoginEmail,
                            child: Text(
                              'ENTRAR',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Colors.amber,
                                  onPressed: controller.doRegister,
                                  child: Text(
                                    'Registrar-se',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color: ColorsConst.primaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Colors.amber,
                                  onPressed: () {},
                                  child: Text(
                                    'Esqueceu a senha?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          color: ColorsConst.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                          color: Colors.white70,
                          onPressed: () async =>
                              _authController.doLoginGoogle(),
                          child: Text(
                            'ENTRAR COM GOOGLE',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.amber[700],
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

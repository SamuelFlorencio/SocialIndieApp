import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:socialindiepro_app/app/controllers/register/register_controller.dart';
import 'package:socialindiepro_app/app/models/user_models/user_model.dart';
import 'package:socialindiepro_app/app/repositories/register_repository.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  IauthRepository authRepository;
  //IregisterRepository registerRepository;
  RegisterRepository registerRepository = RegisterRepository();
  RegisterController registerController;

  _AuthControllerBase() {
    authRepository = Modular.get<IauthRepository>();
    // registerRepository = Modular.get<IregisterRepository>();
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  bool get enableButton => email.isNotEmpty && password.isNotEmpty;

  // ignore: use_setters_to_change_properties
  @action
  void setEmail(String email) => this.email = email;

  // ignore: use_setters_to_change_properties
  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((value) {
      if (value.success) {
        Modular.to.pushReplacementNamed(RoutersConst.profile);
      } else {
        print(value.message);
      }
    });
  }

  Future<void> doLoginEmail() async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.splash);
      } else {
        throw response;
      }
    });
  }

  var map2;
  getUserMap(Map map) {
    map2 = map;
  }

  Future<void> doRegister() async {
    var response = await authRepository.registerEmailPassword(
      email: email,
      password: password,
    );

//executar aki o metodo que cadastra os dados do user com uid

    //var uidauth = await getUidAuth();
    //var userModel = UserModel();
    // var response2 = await registerRepository.registerUserData(
    //);
    
    //registerController.setUserMap();

    await registerRepository.registerUserData(_userModel.toMap());
    //print('$uidauth foiiiiiiiiiiiiiiiiii 2');

    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.splash);
    } else {
      throw response;
    }
  }

  Future<void> doLogout() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      throw response;
    }
  }

//vvvvvvvvvvvvv user data controller vvvvvvvvvvvvvvvvvvvvv

  final UserModel _userModel = UserModel();

  void setUserNameData(String userName) async {
    _userModel.setUserName(userName);
    print(userName);
  }
  void setNameData(String name) async {
    _userModel.setName(name);
    print(name);
  }


}

  

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

class LoginController {

 IauthRepository authRepository;
 
  LoginController(){
    authRepository = Modular.get<IauthRepository>();
  }

  void doEnter() {
    Modular.to.pushReplacementNamed(RoutersConst.profile);
  }

  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((value) {
      if(value.success){
        Modular.to.pushReplacementNamed(RoutersConst.profile);
      }else{
        print(value.message);
      }
    });
  }

  
  Future<void> doLoginEmail(String email, String password) async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.profile);
      } else {
        throw response;
      }
    });
  }
}

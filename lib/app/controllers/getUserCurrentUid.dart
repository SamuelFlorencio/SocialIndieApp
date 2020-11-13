import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetUserCurrentUid{
  Future<String> getUserCurrentUid() async {
  var repository = Modular.get();
  var response2 = await repository.getUser();
  User user = response2.object;
  print(user.uid);
  return user.uid;
  }
}
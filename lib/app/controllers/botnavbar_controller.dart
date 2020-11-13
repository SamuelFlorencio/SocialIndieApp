import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'botnavbar_controller.g.dart';

class BotNavBarController = _BotNavBarControllerBase with _$BotNavBarController;

abstract class _BotNavBarControllerBase with Store implements Disposable{
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }
}

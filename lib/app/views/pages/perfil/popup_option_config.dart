import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../controllers/auth/auth_controller.dart';
import 'widgets/popup_constrants_widget.dart';

class PopupOptionMenu extends StatefulWidget {
  PopupOptionMenu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PopupOptionMenuState createState() => _PopupOptionMenuState();
}

class _PopupOptionMenuState extends State<PopupOptionMenu> {


 AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: choiceAction,
      itemBuilder: (context) {
        return PopupConstrantsWidget.choices.map((choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  void choiceAction(String choice) {
    if (choice == PopupConstrantsWidget.settings) {
      print('Settings');
    } else if (choice == PopupConstrantsWidget.subscribe) {
      print('Subscribe');
    } else if (choice == PopupConstrantsWidget.signOut) {
      _authController.doLogout();
      print('Sair');
    }
  }
}

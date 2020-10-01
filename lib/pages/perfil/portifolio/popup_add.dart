import 'package:flutter/material.dart';

enum MenuOption { Send, Draft }

class PopupAdd extends StatelessWidget {
  const PopupAdd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Text('Novo Projeto'),
            value: MenuOption.Send,
          ),
          PopupMenuItem(
            child: Text('Nova Peça de Portifólio'),
            value: MenuOption.Draft,
          ),
          
        ];
      },
    );
  }
}
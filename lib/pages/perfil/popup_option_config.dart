import 'package:flutter/material.dart';

enum MenuOption { Send, Draft, Discard }

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Text('save'),
            value: MenuOption.Send,
          ),
          PopupMenuItem(
            child: Text('Draft'),
            value: MenuOption.Draft,
          ),
          PopupMenuItem(
            child: Text('Discard'),
            value: MenuOption.Discard,
          ),
        ];
      },
    );
  }
}

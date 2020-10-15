import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../controllers/profile_controller.dart';

class PopupAdd extends StatefulWidget {
  @override
  _PopupAddState createState() => _PopupAddState();
}

class _PopupAddState extends State<PopupAdd> {
  ProfileController _controller;

  @override
  void initState() {
    _controller = Modular.get<ProfileController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // both default to 16
      marginRight: 18,
      marginBottom: 20,

      //animatedIcon: AnimatedIcons.menu_close,
      //animatedIconTheme: IconThemeData(size: 22.0),

      // this is ignored if animatedIcon is non null
      child: Icon(Icons.add, color: Colors.white),

      // If true user is forced to close dial manually
      // by tapping main button and overlay is not rendered.
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Color(0xff7541b5),
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.star_border),
          backgroundColor: Colors.amber,
          //label: 'PORTIFOLIO',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('PORTIFOLIO'),
        ),
        SpeedDialChild(
          child: Icon(Icons.lightbulb_outline),
          backgroundColor: Colors.amber,
          //label: 'PROJETO',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: _controller.doCreateProject,
          
        ),
      ],
    );
  }
}

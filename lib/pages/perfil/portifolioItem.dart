import 'package:flutter/material.dart';
//  import 'package:tcc_app/app/ui/perfil/perfil.dart';

class PortifolioItem extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(1),
     child: Container(
       height: MediaQuery.of(context).size.width / 2 - 2,
       width: MediaQuery.of(context).size.width / 2 - 2,
       color: Colors.amber,
     ),
    );
  }
}
import 'package:flutter/material.dart';
//  import 'package:tcc_app/app/ui/perfil/perfil.dart';

class PortifolioItem extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(2),
     child: Container(

       height: MediaQuery.of(context).size.width / 2 - 2,
       width: MediaQuery.of(context).size.width / 2 - 2,
       color: Colors.grey[350],
       child: Padding(
         padding: const EdgeInsets.only(top: 150),
         child: Container(
           color: Colors.grey[400],
         ),
       ),
     ),
    );
  }
}
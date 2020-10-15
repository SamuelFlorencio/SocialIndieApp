import 'package:flutter/material.dart';
//  import 'package:tcc_app/app/ui/perfil/perfil.dart';

class ProjetoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          //vvv nome do projeto
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //vvv marca tipo do projeto
              Container(
                padding: const EdgeInsets.only(right: 15, left: 330),
                height: 40,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.code),
                    onPressed: () {},
                  ),
                ),
              ),
              //vvv tabbar nome do projeto
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffa76fe8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50,
                            width: 50,
                            image: NetworkImage(
                                'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Nome do Projeto',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          //vvv conteudo
          Container(
            color: Colors.grey[400],
            height: MediaQuery.of(context).size.width / 1 / 1.5,
            width: MediaQuery.of(context).size.width / 1 / 1,
            child: Column(
              children: <Widget>[
                //vvv foto
                Expanded(
                  flex: 8,
                  child: Container(),
                ),
              ],
            ),
          ),
          //botoes (curtir, seguir...)
          Container(
            height: MediaQuery.of(context).size.width / 9,
            width: MediaQuery.of(context).size.width - 2,
            color: Colors.grey[500],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.bookmark),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          //coments
          Container(
            decoration: BoxDecoration(
              /*boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                spreadRadius: 1.0,
              ),
            ],*/
              color: Colors.grey[500],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            height: MediaQuery.of(context).size.width - 300,
          )
        ],
      ),
    );
  }
}

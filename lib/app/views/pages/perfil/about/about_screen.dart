import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socialindiepro_app/app/controllers/profile_controller.dart';
import 'package:socialindiepro_app/app/core/consts/colors_consts.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController customController = TextEditingController();

  ProfileController _profileController = ProfileController();

  @override
  void initState() {
    _profileController = ProfileController();

    super.initState();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Adicione suas habilidades",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextFormField(
              onChanged: _profileController.setSkillData,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                hintText: "Ex: 2D Animation",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // hintText: placeholder,
                /*  hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), */
              ),
              controller: customController,
            ),
            actions: <Widget>[
              SizedBox(
                width: 100,
                child: MaterialButton(
                  color: ColorsConst.amareloColor,
                  elevation: 0,
                  child: Text(
                    'Adicionar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _profileController.doSkillInsert,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.4),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ColorsConst.amareloColor,
        // brightness: Brightness.light,
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser.uid) //joao
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //return Text("Loading");
              return Center(
                child: GlowingProgressIndicator(
                  child: Divider(
                    height: 0,
                    thickness: 20,
                    color: Colors.black.withOpacity(0.2),
                    indent: 10,
                    endIndent: 150,
                  ),
                ),
              );
            } else {
              Map<String, dynamic> documentFields = snapshot.data.data();
              return Container(
                child: Text(
                  'Sobre ' + documentFields["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ),
        elevation: 0,
      ),
      body: _buildBody(context),
      backgroundColor: Colors.grey[350],
    );
  }

  Widget _buildBody(BuildContext context) {
    final _itemExtent = 50.0;
    final generatedList = List.generate(3, (index) => 'Item $index');

    return CustomScrollView(
      controller: ScrollController(initialScrollOffset: _itemExtent * 1),
      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildListDelegate([
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Resumo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side:
                              BorderSide(color: Colors.transparent, width: 2.5),
                        ),
                        elevation: 0,
                        color: Colors.black12,
                        onPressed: () {},
                        child: Text(
                          '+',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.white,
            ),
          ]),
        ),
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Divider(
                    height: 2,
                    thickness: 2.5,
                    color: Colors.black.withOpacity(0.4),
                    indent: 30,
                    endIndent: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Habilidades',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side:
                              BorderSide(color: Colors.transparent, width: 2.5),
                        ),
                        elevation: 0,
                        color: Colors.black12,
                        onPressed: () {
                          createAlertDialog(context);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        SliverFixedExtentList(
          itemExtent: _itemExtent, // I'm forcing item heights
          delegate: SliverChildBuilderDelegate(
            (context, index) => Teste(
              title: generatedList[index],
            ),

            /* ListTile(
              title: Text(
                generatedList[index],
                style: TextStyle(fontSize: 20.0),
              ),
            ), */
            childCount: generatedList.length,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Divider(
                    height: 2,
                    thickness: 2.5,
                    color: Colors.black.withOpacity(0.4),
                    indent: 30,
                    endIndent: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ferramentas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side:
                              BorderSide(color: Colors.transparent, width: 2.5),
                        ),
                        elevation: 0,
                        color: Colors.black12,
                        onPressed: () {},
                        child: Text(
                          '+',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

/* class AboutScreen extends StatelessWidget {
  int program = 1;
  int art = 1;
  int music = 1;

  @override
  Widget build(BuildContext context) {


    int quantAbil = program + art + music;


    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: quantAbil,
          child: Scaffold(
            appBar: buildAppBar(context),
            body: buildTabBarView(context),
          ),
        ));
  }

  TabBarView buildTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        Visibility(
          visible: true,
          child: ListView(
            children: [
              Container(
                height: 60,
                color: Colors.pink,
              ),
              Container(
                height: 60,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Visibility(
          visible: true,
          child: Container(
            color: Colors.green,
          ),
        ),
        Visibility(
          visible: true,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser.uid) //joao
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //return Text("Loading");
            return Center(
              child: GlowingProgressIndicator(
                child: Divider(
                  height: 0,
                  thickness: 20,
                  color: Colors.black.withOpacity(0.2),
                  indent: 10,
                  endIndent: 150,
                ),
              ),
            );
          } else {
            Map<String, dynamic> documentFields = snapshot.data.data();
            return Container(
              child: Text(
                'Sobre ' + documentFields["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
      backgroundColor: ColorsConst.amareloColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black.withOpacity(0.3),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.white70,
              labelColor: ColorsConst.amareloColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              tabs: [
               
                Tab(
                    icon: Container(
                      width: 70,
                      child: Icon(
                        Icons.code,
                        size: 40,
                      ),
                    ),
                    /*   child: Align(
                      alignment: Alignment.center,
                      child: Text('PROGRAMAÇÃO',),
                    ), */
                  ),
                ),
               
                  child: Tab(
                    icon: Container(
                      width: 70,
                      child: Icon(
                        Icons.brush,
                        size: 25,
                      ),
                    ),
                    /* child: Align(
                      alignment: Alignment.center,
                      child: Text('ARTE VISUAL'),
                    ), */
                  ),
                ),
              
                  child: Tab(
                    icon: Container(
                      width: 70,
                      child: Icon(
                        Icons.music_note,
                        size: 25,
                      ),
                    ),
                    /* child: Align(
                      alignment: Alignment.center,
                      child: Text('MÚSICA'),
                    ), */
                  ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */

class Teste extends StatelessWidget {
  final String title;
  var icon = Icons.ac_unit;

  Teste({
    @required this.title,
    // @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(color: Colors.blue, width: 30, height: 30),
              ),
              Container(
                child: Text(
                  title +
                      '  sdafdsalkfjaslçdfjçsakdfajksdfkaçlskdjflçsajkdflsakdjkdf',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
          Divider(
            height: 3,
            thickness: 2.5,
            color: Colors.black.withOpacity(0.05),
            indent: 30,
            endIndent: 30,
          ),
        ],
      ),
    ]);
  }
}

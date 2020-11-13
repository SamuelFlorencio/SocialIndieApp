import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/intro/intro_controller.dart';
import '../../../core/consts/colors_consts.dart';
import 'widgets/slide_dots_widget.dart';
import 'widgets/slide_widget.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends ModularState<IntroPage, IntroController> {
  var _authController;


  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'BEM VINDO',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorsConst.primaryColor,
                          ),
                    ),
                    SlideWidget(
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    SlideDotsWidget(
                      currentPage: currentIndex,
                    ),
                    SizedBox(
                      height: _height * 0.06,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: ColorsConst.primaryColor,
                        onPressed: controller.doEnter,
                        child: Text(
                          'ENTRAR',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 1,
                            color: ColorsConst.secundaryColor,
                            width: 100),
                        Text(
                          'ou',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: ColorsConst.secundaryColor),
                        ),
                        Container(
                            height: 1,
                            color: ColorsConst.secundaryColor,
                            width: 100),
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.04,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.amber[700],
                        onPressed: () async => _authController.doLoginGoogle(),
                        child: Text(
                          'ENTRAR COM GOOGLE',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

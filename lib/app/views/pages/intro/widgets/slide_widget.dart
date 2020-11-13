import 'package:flutter/material.dart';
import '../../../../core/consts/assets_const.dart';
import '../../../widgets/../pages/intro/widgets/slide_page_widget.dart';

class SlideWidget extends StatelessWidget {
  final ValueChanged<int> onPageChanged;

  const SlideWidget({Key key, this.onPageChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: PageView(
          physics: BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: <Widget>[
            SlidePageWidget(
              text: ('Mostre suas habilidades'),
              asset: AssetsConst.step1,
            ),
            SlidePageWidget(
              text: 'Crie e encontre projetos',
              asset: AssetsConst.step2,
            ),
            SlidePageWidget(
              text: 'Junte-se a outras pessoas em projetos inovadores',
              asset: AssetsConst.step3,
            ),
            SlidePageWidget(
              text: 'Encontre investidores para seus projteos',
              asset: AssetsConst.step4,
            ),
          ],
        ),
      ),
    );
  }
}

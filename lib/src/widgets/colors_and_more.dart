import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';

import 'button_color.dart';

class ColorsAndMore extends StatelessWidget {
  final List<Presentation> presentations;
  const ColorsAndMore({
    Key? key,
    required this.presentations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Color> colorSet = Set();
    presentations.forEach((element) {
      colorSet.add(element.color);
    });
    List<Color> colors = colorSet.toList();
    const double hspace = 40;
    List<Widget> colorButtons;
    colorButtons = <Widget>[
      Container(height: 45.0, color: Colors.transparent),
    ];
    for (var i = 0; i < colors.length; ++i) {
      colorButtons.add(Positioned(
          left: hspace * i,
          child: ButtonColor(colors[i], (i + 1), 'assets/imgs/verde.png')));
    }
    

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(child: Stack(children: colorButtons)),
        ],
      ),
    );
  }
}

import 'package:buscape/src/helpers/palette.dart';
import 'package:flutter/material.dart';

class OeschleAppBar extends StatelessWidget {
  final String title;
  final bool isRoot;
  const OeschleAppBar({
    this.isRoot = false,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isRoot? Color(0xFFE10000) : Palette.primary,
      leading: isRoot
          ? null
          : GestureDetector(
            child: Icon(Icons.chevron_left, color: Colors.white, size: 40),
            onTap: () {
              Navigator.pop(context);
            },
          ),
      title: isRoot
      ? Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Image(
            image: AssetImage('assets/imgs/brand.png'),
            fit: BoxFit.contain,
          ),
        ),
      )
      : Text(title),
    );
  }
}

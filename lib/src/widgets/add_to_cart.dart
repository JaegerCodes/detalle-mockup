import 'package:buscape/src/widgets/button_themed.dart';
import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  final double monto;

  AddCartButton({required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Text('\$$monto',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            ButtonThemed(texto: 'Pagar'),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

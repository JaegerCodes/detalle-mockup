import 'package:buscape/src/pages/product_desc_page.dart';
import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget {
  
  final String texto;

  CustomAppBar({
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 30 ),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              if(this.texto.length>0)
                Text( this.texto , style: TextStyle( fontSize: 30, fontWeight: FontWeight.w700 ), ),
              if(this.texto.length==0)
                Text( "Buscar..." , style: TextStyle( fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w700 ), ),
              Spacer(),
              GestureDetector(child: Icon( Icons.search, size: 30 ), onTap: (){
                Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => ProductDescPage() ) );
              },) 

            ],
          ),
        ),
      ),
    );
  }
}
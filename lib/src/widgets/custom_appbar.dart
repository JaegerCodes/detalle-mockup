import 'package:buscape/src/pages/product_desc_page.dart';
import 'package:buscape/src/pages/product_search.dart';
import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget {
  
  final String texto;
  final bool readonly;

  CustomAppBar({
    required this.texto,
    required this.readonly,
  });
  void pushSearchScreen(BuildContext context){
    Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => ProductSearch() ) );
  }
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
              Expanded(child: readonly ? 
                GestureDetector(
                  onTap: (){
                    pushSearchScreen(context);
                  },
                  child: Text(this.texto.length == 0 ? 'Buscar...' : this.texto,
                    style: TextStyle( fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w700),),
                ):
                TextField( 
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                  ),
                  style: TextStyle( fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w700 ),
                )
              ),
              GestureDetector(child: Icon( Icons.search, size: 30 ), onTap: (){
                pushSearchScreen(context);
              },) 

            ],
          ),
        ),
      ),
    );
  }
}
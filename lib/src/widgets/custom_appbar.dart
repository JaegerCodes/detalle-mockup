import 'package:buscape/src/pages/product_search.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String texto;
  final bool readonly;
  final Function(String)? onChanged;

  SearchBar({
    required this.texto,
    required this.readonly,
    this.onChanged,
  });
  void pushSearchScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ProductSearch()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
        bottom: 10,
      ),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                child: readonly
                    ? GestureDetector(
                        onTap: () {
                          pushSearchScreen(context);
                        },
                        child: Text(
                          this.texto.length == 0 ? 'Buscar...' : this.texto,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    : TextField(
                        autofocus: true,
                        onChanged: (x) {
                          if (onChanged != null) {
                            onChanged!(x);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Buscar...',
                        ),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      )),
            GestureDetector(
              child: Icon(Icons.search, size: 30),
              onTap: () {
                pushSearchScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

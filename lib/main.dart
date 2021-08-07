import 'package:buscape/src/models/zapato_model.dart';
import 'package:buscape/src/pages/zapato_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() {

  return runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => new ZapatoModel() ),
      ],
      child: MyApp()
    )
  );

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuscaPe',
      debugShowCheckedModeBanner: false,
      home: ProductPage()
      // home: ZapatoDescPage()
    );
  }
}
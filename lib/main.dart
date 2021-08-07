import 'package:buscape/src/models/product_model.dart';
import 'package:buscape/src/pages/product_page.dart';
import 'package:buscape/src/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => new ProductModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuscaPe',
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      scaffoldMessengerKey: NotificationsService.messengerKey,
      // home: ZapatoDescPage()
    );
  }
}

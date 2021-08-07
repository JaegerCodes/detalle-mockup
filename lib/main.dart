import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:buscape/src/pages/product_page.dart';
import 'package:buscape/src/providers/product_provider.dart';
import 'package:buscape/src/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  BuscapeApi.configureDio();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductModel()),
        ChangeNotifierProvider(create: ( _ ) => ProductsProvider() ),
      ],
      child: MyApp(),
    );
  }
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

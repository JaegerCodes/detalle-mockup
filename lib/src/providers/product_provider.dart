
import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {

  ProductsResponse? products;

  getProducts() async {
    final resp = await BuscapeApi.httpGet('/products/catalog?searchWord=chompa de mujer');
    //final productsResp = ProductsResponse.fromMap(resp);

    //this.products = [...categoriesResp.categorias];
    //this.categorias = productsResp;
    print( resp );

    notifyListeners();
  }

}
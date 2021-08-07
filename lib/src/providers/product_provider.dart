
import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {

  ProductsResponse? productsResponse;
  List<Item>? products;
  
  getProducts({String searchWord = 'chompa de mujer'}) async {
    final resp = await BuscapeApi.httpGet('/products/catalog?searchWord=$searchWord');
    final productsResp = ProductsResponse.fromMap(resp);

    //this.products = [...categoriesResp.categorias];
    this.products = productsResp.body.hits.hits.first.source.items;
    print( products );

    // notifyListeners();
  }

}
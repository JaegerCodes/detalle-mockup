import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/providers/product_provider.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  List<Item> products = [];
  getProducts({String searchWord = 'chompa de mujer'}) async {
    final resp =
        await BuscapeApi.httpGet('/products/catalog?searchWord=$searchWord');
    final productsResp = ProductsResponse.fromMap(resp);
    print(productsResp);

    //this.products = [...categoriesResp.categorias];
    setState(() {
      this.products = productsResp.itemList;
    });
  }

  @override
  void initState() {
    super.initState();

    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();

    return Scaffold(
      // body: CustomAppBar( texto: 'For you' )
      // body: ZapatoSizePreview(),
      body: Column(
        children: <Widget>[
          OeschleAppBar(title: "Búsqueda de producto"),
          SearchBar(
            texto: '',
            readonly: false,
            onChanged: (word) {
              getProducts(searchWord: word);
            },
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: this
                  .products
                  .map((e) => ProductListItem(
                        tag: e.productId.toString(),
                        data: e,
                      ))
                  .toList(),
            ),
          )),
        ],
      ),
    );
  }
}

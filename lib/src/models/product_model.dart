import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  String  _assetImage = 'assets/imgs/azul.png';
  String  _size = '9.0';
  Color   _color = Colors.white;
  Item?    _data;
  Presentation? _presentation;

  String get assetImage => this._assetImage;
  set assetImage(String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  String get size => this._size;
  set size(String valor) {
    this._size = valor;
  }

  void initSize(String valor) {
    this._size = valor;
  }

  Color get color => this._color;
  set color(Color valor) {
    this._color = valor;
    notifyListeners();
  }

  Item get data => this._data!;
  set data(Item valor) {
    this._data = valor;
  }

  Presentation get presentation => this._presentation!;
  set presentation(Presentation valor) {
    this._presentation = valor;
  }

  setPresentation() {
    List<Presentation> presentations = _data!.presentations;

    for (var i = 0; i < presentations.length; ++i) {
      final current = presentations[i];
      if (current.size == _size && current.color == _color) {
        this._presentation = current;
        notifyListeners();
        break;
      }
    }
  }
}

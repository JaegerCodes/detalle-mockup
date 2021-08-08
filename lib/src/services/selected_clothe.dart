
import 'package:flutter/material.dart';
import 'package:buscape/src/models/product_response.dart';

class SelectedClothe {

  static Color color = Colors.white;
  static String size = 'S';
  static List<String> urls = [];
  static Item?  data;
  static Presentation? presentation;
  
  static setColor(Color value) {
    color = value;
  }

  static setSize(String value) {
    size = value;
  }

  static setUrls(List<String> value) {
    urls = value;
  }

  static setData(Item value) {
    data = value;
  }

  static setPresentation({bool buscarPorColor = false}) {
    List<Presentation> presentations = data!.presentations;

    if (buscarPorColor) {
      for (var i = 0; i < presentations.length; ++i) {
        final current = presentations[i];
        if (current.color == color) {
          presentation = current;
          break;
        }
      }
    } else {
      for (var i = 0; i < presentations.length; ++i) {
        final current = presentations[i];
        if (current.size == size) {
          presentation = current;
          break;
        }
      }
    }
  }

}
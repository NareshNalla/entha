// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:controlshop/components/globalvariables.dart' as globals;
import 'package:controlshop/models/items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatedItems extends ChangeNotifier {
  String? _productName;
  String? get productName => _productName;

  void setProductName(input) {
    _productName = input;
    notifyListeners();
  }

  double? _salePrice = 0;
  double? get salePrice => _salePrice;

  void setSalePrice(input) {
    _salePrice = input;
    notifyListeners();
  }

  double? _purchasePrice = 0;
  double? get purchasePrice => _purchasePrice;

  void setPurchasePrice(input) {
    _purchasePrice = input;
    notifyListeners();
  }

  double? _stock = 0;
  double? get stock => _stock;

  void setStock(input) {
    _stock = input;
    notifyListeners();
  }

  List<NewItems> _newItemsList = [];

  UnmodifiableListView<NewItems> get newItemsList =>
      UnmodifiableListView(_newItemsList);

  addItem(NewItems newItem, BuildContext context) {
    _newItemsList.add(newItem);
    storeNewItem(newItem, context);
    notifyListeners();
  }

  deleteitem(index) {
    _newItemsList.removeWhere((_newitems) =>
        _newitems.productName == newItemsList[index].productName);
    notifyListeners();
  }

  void storeNewItem(NewItems newItem, BuildContext context) {
    try {
      final json = newItem.toJson();
      globals.ref_products!
          .push()
          .set(json)
          .then((value) => ScaffoldMessenger.of(context)
              // ignore: prefer_const_constructors
              .showSnackBar(SnackBar(content: Text('Datastored'))));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}

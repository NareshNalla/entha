//import 'package:invoiceapp/Components/globalvariables.dart' as globals;

class Items {
  String? productName;
  String? salePrice;
  // String? hsn;
  String? purchasePrice;
  String? stock;

  Items(this.productName, this.salePrice);

  // this.hsn,
  // this.purchasePrice,
}

class NewItems {
  final String? productName;
  final double? salePrice;
  final double? purchasePrice;
  final double? stock;

  NewItems(this.productName, this.salePrice, this.purchasePrice, this.stock);
  Map<String, dynamic> toJson() => {
        'productName': productName,
        'salePrice': salePrice,
        'purchasePrice': purchasePrice,
        'stock': stock
      };
  /*factory NewItems.fromJson(Map<String, dynamic> json) {
    return NewItems(
      productName: (json['productName']),
      salePrice: (json['salePrice'] as double),
      purchasePrice: (json['purchasePrice'] as double),
      stock: (json['stock'] as double),
    );
  }*/
}

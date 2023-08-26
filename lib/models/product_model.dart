part of 'model.dart';

class ProductModel {
  int? no;
  String? productId;
  String? productName;
  String? productDescription;
  String? productValue;
  String? productType;
  String? productPhoto;

  ProductModel({
    this.no,
    this.productId,
    this.productName,
    this.productDescription,
    this.productValue,
    this.productType,
    this.productPhoto,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) => ProductModel(
        no: data['NO'],
        productId: data['productId'],
        productName: data['productName'],
        productDescription: data['productDescription'],
        productValue: data['productValue'],
        productType: data['productType'],
        productPhoto: data['productPhoto'],
      );

  toJson() {
    return {
      'NO': no,
      'productId': productId,
      'productName': productName,
      'productDescription': productDescription,
      'productValue': productValue,
      'productType': productType,
      'productPhoto': productPhoto,
    };
  }
}

part of 'model.dart';

class ProductModel {
  int? no;
  String? productId;
  String? productName;
  String? productDescription;
  String? productValue;
  String? productType;
  String? productPhoto;
  String? productSize;

  ProductModel({
    this.no,
    this.productId,
    this.productName,
    this.productDescription,
    this.productValue,
    this.productType,
    this.productPhoto,
    this.productSize,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) => ProductModel(
        no: data['NO'],
        productId: data['productId'],
        productName: data['productName'],
        productDescription: data['productDescription'],
        productValue: data['productValue'],
        productType: data['productType'],
        productPhoto: data['productPhoto'],
        productSize: 'S',
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

  ProductModel copyWith({
    int? no,
    String? productId,
    String? productName,
    String? productDescription,
    String? productValue,
    String? productType,
    String? productPhoto,
    String? productSize,
  }) =>
      ProductModel(
        no: no ?? this.no,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productDescription: productDescription ?? this.productDescription,
        productValue: productValue ?? this.productValue,
        productType: productType ?? this.productType,
        productPhoto: productPhoto ?? this.productPhoto,
        productSize: productSize ?? this.productSize,
      );
}

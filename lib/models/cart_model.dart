part of 'model.dart';

class CartModel {
  String? id;
  ProductModel? product;
  int? quantity;
  bool? check;

  CartModel({
    this.id,
    this.product,
    this.quantity,
    this.check = false,
  });
  factory CartModel.fromJson(String id, Map<String, dynamic> data) => CartModel(
        id: id,
        product: ProductModel.fromJson(data['product']),
        quantity: data['quantity'],
        check: data['check'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product!.toJson(),
      'quantity': quantity,
      'check': check,
    };
  }

  getTotalPrice() {
    return ((int.parse(product!.productValue!) * quantity!) * 14987);
  }
}

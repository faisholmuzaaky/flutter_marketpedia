import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cart = [];

  addCart(ProductModel product) async {
    emit(CartLoading());
    if (productIsexist(product)) {
      int index = cart.indexWhere(
          (element) => element.product!.productId == product.productId);
      cart[index].quantity = cart[index].quantity! + 1;
    } else {
      final data = CartModel(
        id: '${cart.length}',
        product: product,
        quantity: 1,
      );
      cart.add(data);
    }
    emit(CartSuccess(cart));
  }

  productIsexist(ProductModel product) {
    if (cart.indexWhere(
            (element) => element.product!.productId == product.productId) ==
        -1) {
      return false;
    }
    return true;
  }

  removeCart(int id) {
    cart.removeAt(id);
    emit(CartSuccess(cart));
  }

  addQuantity(CartModel cartItem) {
    emit(CartLoading());
    int index = cart.indexWhere((element) => element.id == cartItem.id);
    cart[index].quantity = cart[index].quantity! + 1;
    emit(CartSuccess(cart));
  }

  reduceQuantity(CartModel cartItem) {
    emit(CartLoading());
    int index = cart.indexWhere((element) => element.id == cartItem.id);
    cart[index].quantity = cart[index].quantity! - 1;
    if (cart[index].quantity == 0) {
      cart.removeAt(index);
    }
    emit(CartSuccess(cart));
  }

  totalPrice() {
    int price = 0;
    for (var item in cart) {
      price += (item.quantity! * int.parse(item.product!.productValue!));
    }
    return price;
  }
}

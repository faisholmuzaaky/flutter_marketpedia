import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marketpedia/services/service.dart';

import '../models/model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cart = [];

  getallCart() {
    emit(CartSuccess(cart));
  }

  addCart(ProductModel product, {String? size}) async {
    emit(CartLoading());
    print(size);
    if (productIsexist(product)) {
      int index = cart.indexWhere((element) =>
          element.product!.productId == product.productId &&
          element.product!.productSize == size);
      print('index : $index');
      cart[index].quantity = cart[index].quantity! + 1;
      // if (size != null) {
      //   cart[index].product!.productSize = size;
      // }
    } else {
      final data = CartModel(
        id: '${cart.length}',
        product: product,
        quantity: 1,
      );
      cart.add(data);
    }
    emit(CartSubmit());
  }

  productIsexist(ProductModel product) {
    final isProductIdSame = cart.indexWhere(
            (element) => element.product!.productId == product.productId) ==
        -1;
    final isProductSizeSame = cart.indexWhere(
            (element) => element.product!.productSize == product.productSize) ==
        -1;
    print('isProductIdSame : $isProductIdSame');
    print('isProductSizeSame : $isProductSizeSame');
    if (isProductIdSame || isProductSizeSame) {
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

  checkOut() async {
    emit(CartLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (cart.isNotEmpty) {
      final res = await ProductServices().checkout(cart: cart);
      if (res.value!) {
        cart.clear();
        emit(CartInitial());
        emit(CartCheckoutSuccess());
      } else {
        emit(const CartFailed('Failed to Checkout'));
      }
    } else {
      emit(const CartFailed('Failed to Checkout'));
    }
  }
}

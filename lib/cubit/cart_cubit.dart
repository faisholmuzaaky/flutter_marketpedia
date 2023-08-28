import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marketpedia/services/service.dart';
import 'package:flutter_marketpedia/shared/shared.dart';
import 'package:get_storage/get_storage.dart';

import '../models/model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cart = [];

  final box = GetStorage();

  getallCart() {
    var data = getAllCartFromLocal();
    if (data == null) {
      emit(CartSuccess(cart));
    } else {
      if (data is List<CartModel>) {
        cart = data;
      } else {
        for (var element in data) {
          cart.add(CartModel.fromJson(element));
        }
      }
      saveAllCart(cart);

      emit(CartSuccess(cart));
    }
  }

  addCart(ProductModel product, {String? size}) async {
    emit(CartLoading());
    if (productIsexist(product)) {
      int index = cart.indexWhere((element) =>
          element.product!.productId == product.productId &&
          element.product!.productSize == size);
      cart[index].quantity = cart[index].quantity! + 1;
      saveAllCart(cart);
    } else {
      final data = CartModel(
        id: '${cart.length}',
        product: product,
        quantity: 1,
      );
      cart.add(data);
      saveAllCart(cart);
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
    saveAllCart(cart);
    emit(CartSuccess(cart));
  }

  reduceQuantity(CartModel cartItem) {
    emit(CartLoading());
    int index = cart.indexWhere((element) => element.id == cartItem.id);
    cart[index].quantity = cart[index].quantity! - 1;
    if (cart[index].quantity == 0) {
      cart.removeAt(index);
    }
    saveAllCart(cart);
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
    try {
      emit(CartLoading());
      await Future.delayed(const Duration(seconds: 2));
      ApiReturnValue<bool> res = await ProductServices().checkout(cart: cart);
      if (res.value == true) {
        cart.clear();
        saveAllCart(cart);
        emit(CartCheckoutSuccess());
      } else {
        emit(const CartFailed('Failed to Checkout'));
      }
    } catch (e) {
      rethrow;
    }
  }
}

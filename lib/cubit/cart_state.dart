part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> cart;
  const CartSuccess(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartFailed extends CartState {
  final String message;
  const CartFailed(this.message);
  @override
  List<Object> get props => [message];
}

class CartCheckoutSuccess extends CartState {}

class CartSubmit extends CartState {}

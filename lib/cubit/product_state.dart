part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  const ProductSuccess(this.products);
  @override
  List<Object> get props => [products];
}

final class ProductFailed extends ProductState {
  final String message;
  const ProductFailed(this.message);
  @override
  List<Object> get props => [message];
}

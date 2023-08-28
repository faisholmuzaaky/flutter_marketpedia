import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marketpedia/services/service.dart';

import '../models/model.dart';
// import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> getAllProducts() async {
    // emit(ProductLoading());
    ApiReturnValue<List<ProductModel>> result =
        await ProductServices().getAllProducts();

    if (result.value != null) {
      emit(ProductSuccess(result.value!));
    } else {
      emit(ProductFailed(result.message));
    }
  }
}

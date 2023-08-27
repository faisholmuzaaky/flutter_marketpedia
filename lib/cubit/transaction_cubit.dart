import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/model.dart';
import '../services/service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getHistoryTransaction() async {
    // emit(TransactionLoading());
    ApiReturnValue<List<TransactionModel>> result =
        await ProductServices().getHistoryTransaction();

    if (result.value != null) {
      emit(TransactionSuccess(result.value!));
    } else {
      emit(TransactionFailed(result.message));
    }
  }
}

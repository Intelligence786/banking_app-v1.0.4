import 'package:banking_app/data/data_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';
import '../../../data/models/wallet_model.dart';

part 'income_event.dart';

part 'income_state.dart';

/// A bloc that manages the state of a Income according to the event that is dispatched to it.
class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeBloc(IncomeState initialState) : super(initialState) {
    on<IncomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IncomeInitialEvent event,
    Emitter<IncomeState> emit,
  ) async {
    final returned = await DataManager.getWallet();
    emit(
      state.copyWith(
        incomeModelObj: returned.categories,
      ),
    );
  }
}

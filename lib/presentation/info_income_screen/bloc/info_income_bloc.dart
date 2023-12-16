import 'dart:async';
import 'package:banking_app/data/models/wallet_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';


part 'info_income_event.dart';
part 'info_income_state.dart';

/// A bloc that manages the state of a PersonalIncome according to the event that is dispatched to it.
class InfoIncomeBloc
    extends Bloc<InfoIncomeEvent, InfoIncomeState> {
  InfoIncomeBloc(InfoIncomeState initialState) : super(initialState) {
    on<InfoIncomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
      InfoIncomeInitialEvent event,
      Emitter<InfoIncomeState> emit,
      ) async {}
}

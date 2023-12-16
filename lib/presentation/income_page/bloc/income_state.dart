// ignore_for_file: must_be_immutable

part of 'income_bloc.dart';

/// Represents the state of Income in the application.
class IncomeState extends Equatable {
  IncomeState({this.incomeModelObj});

  List<IncomeModel>? incomeModelObj;

  @override
  List<Object?> get props => [
        incomeModelObj,
      ];
  IncomeState copyWith({List<IncomeModel>? incomeModelObj}) {
    return IncomeState(
      incomeModelObj: incomeModelObj ?? this.incomeModelObj,
    );
  }
}

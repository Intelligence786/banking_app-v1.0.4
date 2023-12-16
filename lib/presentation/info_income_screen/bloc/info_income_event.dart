part of 'info_income_bloc.dart';

@immutable
abstract class InfoIncomeEvent extends Equatable {}

/// Event that is dispatched when the PersonalIncome widget is first created.
class InfoIncomeInitialEvent extends InfoIncomeEvent {
  @override
  List<Object?> get props => [];
}

part of 'info_income_bloc.dart';

class InfoIncomeState extends Equatable {
  InfoIncomeState({this.incomeModel});

  IncomeModel? incomeModel;

  @override
  List<Object?> get props => [
    incomeModel,
  ];
  InfoIncomeState copyWith({IncomeModel? incomeModel}) {
    return InfoIncomeState(
      incomeModel:
      incomeModel ?? this.incomeModel,
    );
  }
}

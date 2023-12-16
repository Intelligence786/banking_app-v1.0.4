// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [personal_income_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PersonalIncomeModel extends Equatable {
  PersonalIncomeModel() {}

  PersonalIncomeModel copyWith() {
    return PersonalIncomeModel();
  }

  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'main_bloc.dart';

/// Represents the state of Main in the application.
class MainState extends Equatable {
  MainState({this.mainModelObj});

  MainModel? mainModelObj;

  @override
  List<Object?> get props => [
        mainModelObj,
      ];

  MainState copyWith({MainModel? mainModelObj}) {
    return MainState(
      mainModelObj: mainModelObj ?? this.mainModelObj,
    );
  }
}

class MainLoadingState extends MainState {
  @override
  bool get stringify => true; // optional, but recommended for logging

  @override
  List<Object?> get props => []; // no additional props for loading state
}

class MainLoadedState extends MainState {
  final List<NewsModel> newsList;

  MainLoadedState({required this.newsList});

  @override
  List<Object?> get props => [newsList];
}

class MainErrorState extends MainState {
  final String errorMessage;

  MainErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

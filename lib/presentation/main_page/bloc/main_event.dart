// ignore_for_file: must_be_immutable

part of 'main_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Main widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MainEvent extends Equatable {}

/// Event that is dispatched when the Main widget is first created.
class MainInitialEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}


// MainLoadNewsEvent is fired to load the newslist from a data source.
class MainLoadNewsEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

// MainUpdateNewsEvent is fired to update specific news items in the state.
class MainUpdateNewsEvent extends MainEvent {
  final int index;
  final NewslistItemModel updatedNews;

  MainUpdateNewsEvent({
    required this.index,
    required this.updatedNews,
  });

  @override
  List<Object?> get props => [index, updatedNews];
}

// MainErrorEvent is fired to handle errors during data retrieval.
class MainErrorEvent extends MainEvent {
  final String errorMessage;

  MainErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

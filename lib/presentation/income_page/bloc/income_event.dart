// ignore_for_file: must_be_immutable

part of 'income_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Income widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class IncomeEvent extends Equatable {}

/// Event that is dispatched when the Income widget is first created.
class IncomeInitialEvent extends IncomeEvent {
  @override
  List<Object?> get props => [];
}

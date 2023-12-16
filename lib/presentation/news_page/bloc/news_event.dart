// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///News widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NewsEvent extends Equatable {}

/// Event that is dispatched when the News widget is first created.
class NewsInitialEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class NewsLoadEvent extends NewsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsCategorySelectedEvent extends NewsEvent {
  final CategoryModel categoryModel;

  NewsCategorySelectedEvent(this.categoryModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

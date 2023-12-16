// ignore_for_file: must_be_immutable

import 'package:banking_app/data/models/news_model.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'newslist_item_model.dart';

/// This class defines the variables used in the [main_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MainModel extends Equatable {
  MainModel({this.newslistItemList = const []}) {}

  List<NewsModel> newslistItemList;

  MainModel copyWith({List<NewsModel>? newslistItemList}) {
    return MainModel(
      newslistItemList: newslistItemList ?? this.newslistItemList,
    );
  }

  @override
  List<Object?> get props => [newslistItemList];
}

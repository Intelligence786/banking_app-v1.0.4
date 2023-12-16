// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

/// Represents the state of News in the application.
class NewsState extends Equatable {
  NewsState( {this.newsModelObj, this.categories = const [], this.selectedCategory ,});

  List<NewsModel>? newsModelObj;
  List<CategoryModel> categories = [];
  final CategoryModel? selectedCategory ;

  @override
  List<Object?> get props => [
        newsModelObj,
        categories,
        selectedCategory,
      ];

  NewsState copyWith(
      {List<NewsModel>? newsModelObj,
      List<CategoryModel>? categories,
      CategoryModel? selectedCategory}) {

    return NewsState(
      newsModelObj: newsModelObj ?? this.newsModelObj,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

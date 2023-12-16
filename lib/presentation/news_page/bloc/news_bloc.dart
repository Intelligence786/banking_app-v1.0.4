import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';
import '../../../data/models/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

/// A bloc that manages the state of a News according to the event that is dispatched to it.
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(NewsState initialState) : super(initialState) {
    on<NewsInitialEvent>(_onInitialize);
    on<NewsCategorySelectedEvent>(_onCategorySeleted);
  }

  _onInitialize(
    NewsInitialEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
          newsModelObj: await DataManager.getAllNews(),
          categories: DataManager.categories,
          selectedCategory: DataManager.categories[0]),
    );
  }

  _onCategorySeleted(
      NewsCategorySelectedEvent event, Emitter<NewsState> emit) async {
    List<NewsModel> byCategoryNews;

    if (event.categoryModel == DataManager.categories[0]) {
      // Если выбрана категория с индексом 0, показать все новости
      byCategoryNews = await DataManager.getAllNews();
    } else {
      // В противном случае, показать новости только для выбранной категории
      byCategoryNews = await DataManager.getCategoryNews(event.categoryModel);
    }

    emit(state.copyWith(
      selectedCategory: event.categoryModel,
      newsModelObj: byCategoryNews,
    ));
  }

}

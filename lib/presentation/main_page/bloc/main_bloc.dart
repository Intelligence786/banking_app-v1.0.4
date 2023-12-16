import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/news_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';
import '../models/main_model.dart';
import '../models/newslist_item_model.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(MainState initialState) : super(initialState) {
    on<MainInitialEvent>(_onInitialize);
    on<MainLoadNewsEvent>(_loadNews);
    on<MainUpdateNewsEvent>(_updateNews);
    on<MainErrorEvent>(_handleError);
  }

  _onInitialize(
    MainInitialEvent event,
    Emitter<MainState> emit,
  ) async {
    DataManager.getWallet();
    emit(MainLoadingState());
    try {
      _loadNews(MainLoadNewsEvent(), emit);
    } catch (error) {
      emit(MainErrorState(errorMessage: error.toString()));
    }
  }

  _loadNews(MainLoadNewsEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingState());
    try {
      final newslist = await _fetchNewsList();

      emit(MainLoadedState(newsList: newslist));
    } catch (error) {
      emit(MainErrorState(errorMessage: error.toString()));
    }
  }

  _updateNews(MainUpdateNewsEvent event, Emitter<MainState> emit) async {
    // Implement logic to update specific news items in the state based on event data
    // ...
  }

  _handleError(MainErrorEvent event, Emitter<MainState> emit) {
    emit(MainErrorState(errorMessage: event.errorMessage));
  }

  Future<List<NewsModel>> _fetchNewsList() async {
    // Implement logic to retrieve newslist items from a data source (API, DB)
    // ...
    // Replace with actual data retrieval logic
    return await DataManager.getAllNews(); //fillNewslistItemList();
  }

  _updateNewsList(List<NewslistItemModel> newslist) async {
    // Implement logic to update the newslist in the state based on the new list
    // ...
  }

  List<NewslistItemModel> fillNewslistItemList() {
    return [
      NewslistItemModel(
          image: ImageConstant.imgVector,
          headerText:
              "Implementation of new technologies for ensuring the security",
          dateText: "16 may, 2023",
          contentText:
              "The implementation of new technologies plays an important role in ensuring the security of financial transactions. "),
      NewslistItemModel(
          image: ImageConstant.imgVector88x100,
          headerText: "Increase in the interest rate on deposits for clients",
          dateText: "16 may, 2023",
          contentText:
              "Increasing the interest rate on deposits for clients can be driven by a number of factors, such as changes in the economy, banking policy, or financial markets."),
      NewslistItemModel(
          image: ImageConstant.imgVector1,
          headerText:
              "Partnership with financial institutions to expand services.",
          dateText: "16 may, 2023",
          contentText:
              "Partnership with financial institutions is a strategic step towards expanding our services.."),
      NewslistItemModel(
          image: ImageConstant.imgVector2,
          headerText: "Implementation of cryptocurrency operations.",
          dateText: "16 may, 2023",
          contentText:
              "The implementation of cryptocurrency operations is the process of integrating the ability to conduct financial transactions using cryptocurrency into various aspects of business and everyday life."),
      NewslistItemModel(
          image: ImageConstant.imgVector3,
          headerText: "Rewards program for clients for using online banking.",
          dateText: "16 may, 2023",
          contentText:
              "A customer incentive program for using online banking may offer a variety of benefits, such as no fees for certain transactions, higher deposit interest rates, loan discounts, or privileges when using other financial instruments offered by the bank."),
      NewslistItemModel(
          image: ImageConstant.imgVector4,
          headerText: "Introduction of new credit products for entrepreneurs.",
          dateText: "16 may, 2023",
          contentText:
              "The introduction of new credit products for entrepreneurs is a strategically important decision for a financial institution aimed at meeting the needs of entrepreneurs and fostering business growth. ")
    ];
  }
}

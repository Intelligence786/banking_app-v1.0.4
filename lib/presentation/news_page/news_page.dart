import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/category_model.dart';
import 'package:banking_app/widgets/app_bar/appbar_title.dart';
import 'package:banking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:banking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../data/models/news_model.dart';
import 'bloc/news_bloc.dart';
import 'widgets/category_item_widget.dart';
import 'widgets/news_large_item_widget.dart';

class CategorySelectionManager {
  CategoryModel? selectedCategory;

  void selectCategory(CategoryModel category) {
    selectedCategory = category;
  }

  bool isCategorySelected(CategoryModel category) {
    return selectedCategory == category;
  }
}

class NewsPage extends StatefulWidget {
  NewsPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  CategorySelectionManager categorySelectionManager =
      CategorySelectionManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorySelectionManager.selectCategory(DataManager.categories[0]);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(NewsState(
          newsModelObj: [],
        ))
          ..add(NewsInitialEvent()),
        child: Container(
          //padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 195.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_financial_news_of".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.38,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.v),

              //_buildCategoryButtons(context, state),
              _buildFinancialNewsList(context),
              SizedBox(height: 20.v),
              _buildNewsLargeContainer(context),
            ],
          ),
        ),
      ),
    );
    //  appBar: _buildAppBar(context),

    // bottomNavigationBar: _buildTabBar(context),
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_news".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgOtherIconsOnprimary24x24,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 15.v),
          onTap: () => {},
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFinancialNewsList(BuildContext context) {
    return SizedBox(
      height: 32.v,
      child: BlocSelector<NewsBloc, NewsState, List<CategoryModel>?>(
        selector: (state) => state.categories,
        builder: (context, categories) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 8.h,
              );
            },
            itemCount: categories?.length ?? 0,
            itemBuilder: (context, index) {
              CategoryModel model =
                  categories?[index] ?? CategoryModel(id: -1, name: 'name');
              return CategoryItemWidget(
                model,
                isSelected: categorySelectionManager.isCategorySelected(model!),
                onTap: () {
                  setState(() {
                    categorySelectionManager.selectCategory(model);
                  });
                  context
                      .read<NewsBloc>()
                      .add(NewsCategorySelectedEvent(model));
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildNewsLargeContainer(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: BlocSelector<NewsBloc, NewsState, List<NewsModel>?>(
          selector: (state) => state.newsModelObj,
          builder: (context, newsModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 31.v,
                );
              },
              itemCount: newsModelObj?.length ?? 0,
              itemBuilder: (context, index) {
                NewsModel model = newsModelObj?[index] ?? NewsModel();
                return NewsLargeItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

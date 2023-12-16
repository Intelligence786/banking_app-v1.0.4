import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/news_model.dart';
import 'package:flutter/material.dart';

import 'bloc/main_bloc.dart';
import 'models/main_model.dart';
import 'widgets/newslist_item_widget.dart';

class MainPage extends StatefulWidget {
   MainPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {


    super.initState();
    DataManager.getWallet().then((value) => {
      setState((){

      }),
    });
    print(DataManager.data.getTotalAmount());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appTheme.gray30001,
        // width: double.maxFinite,
        padding: EdgeInsets.only(top: 30.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl_good_morning".tr,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 18.v),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl_amount_income".tr,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 2.v),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                '${DataManager.data.getTotalAmount()} \$',
                style: CustomTextStyles.headlineLargeBold,
              ),
            ),
            SizedBox(height: 21.v),
            _buildHeaderRow(context),
            Expanded(
              child: BlocProvider<MainBloc>(
                create: (context) => MainBloc(
                  MainState(
                    mainModelObj: MainModel(),
                  ),
                )..add(MainInitialEvent()),
                child: Container(
                  width: double.infinity,
                  color: appTheme.gray50.withOpacity(0.8),
                  child: BlocBuilder<MainBloc, MainState>(
                    builder: (context, state) {
                      if (state is MainLoadedState) {
                        return _buildNewsList(context, state.newsList);
                      } else if (state is MainErrorState) {
                        return Center(
                          child: Text('News cant loadede'),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderRow(BuildContext context) {
    return Container(
      //width: double.maxFinite,
      padding: EdgeInsets.only(
        right: 16.h,
        left: 16.h,
        top: 30.h,
      ),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_news".tr,
            style: theme.textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: Text(
              "lbl_view_all".tr,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNewsList(BuildContext context, List<NewsModel> newsList) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 0),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 1.v,
        );
      },
      itemCount: newsList.length ?? 0,
      itemBuilder: (context, index) {
        NewsModel model = newsList[index] ?? NewsModel();
        return NewslistItemWidget(
          model,
        );
      },
    );
  }
}

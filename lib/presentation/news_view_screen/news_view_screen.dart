import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:banking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:banking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/news_model.dart';

class NewsViewScreen extends StatelessWidget {
  final NewsModel newsModel;

  NewsViewScreen({Key? key, required this.newsModel})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context, NewsModel newsModel) {
    return NewsViewScreen(
      newsModel: newsModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(

        child: Column(
          children: [
            SizedBox(height: 3.v),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: 334.h,
                        //margin: EdgeInsets.only(right: 23.h),
                        child: Text(
                          newsModel.title ?? '',
                          // maxLines: 3,
                          overflow: TextOverflow.visible,
                          style: theme.textTheme.headlineLarge!.copyWith(
                            height: 1.25,
                          ),
                        ),
                      ), SizedBox(height: 16.v),
                      Text(
                        DateFormat('dd MMMM, yyyy').format(newsModel.date??DateTime.now()),
                        style: CustomTextStyles.bodyLargeOnPrimary,
                      ),
                      SizedBox(height: 16.v),
                      CustomImageView(
                        fit: BoxFit.fill,
                        imagePath: newsModel.imgUrl,
                        height: 255.v,
                        width: 358.h,
                        radius: BorderRadius.circular(
                          16.h,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      SizedBox(
                        width: 354.h,
                        child: Text(
                          newsModel.body ?? '',
                          maxLines: 27,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            height: 1.38,
                          ),
                        ),
                      ),
                    ],
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgOtherIconsOnprimary,
        margin: EdgeInsets.all(8.h),
      ),
      title: AppbarSubtitle(
        text: "lbl_all_news".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
    );
  }
}

import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NewsLargeItemWidget extends StatelessWidget {
  NewsLargeItemWidget(
    this.newsModel, {
    Key? key,
  }) : super(
          key: key,
        );

  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.newsViewScreen,
            arguments: newsModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            fit: BoxFit.fill,
            imagePath: newsModel?.imgUrl,
            height: 255.v,
            width: 358.h,
            radius: BorderRadius.circular(
              16.h,
            ),
          ),
          SizedBox(height: 13.v),
          Container(
            width: 324.h,
            margin: EdgeInsets.only(right: 33.h),
            child: Text(
              newsModel.title!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineSmall!.copyWith(
                height: 1.17,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            DateFormat('dd MMMM, yyyy').format(newsModel.date??DateTime.now()),

            style: CustomTextStyles.bodyLargeOnPrimary,
          ),
          SizedBox(height: 8.v),
          Container(
            width: 338.h,
            margin: EdgeInsets.only(right: 19.h),
            child: Text(
              newsModel.body!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:banking_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/news_model.dart';

// ignore: must_be_immutable
class NewslistItemWidget extends StatelessWidget {
  NewslistItemWidget(
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
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.fillGray50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    fit: BoxFit.fill,
                    imagePath: newsModel?.imgUrl,
                    height: 90.v,
                    width: 100.h,
                    radius: BorderRadius.circular(
                      8.h,
                    ),
                    margin: EdgeInsets.only(top: 2.v),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 235.h,
                        child: Text(
                          newsModel.title!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge!.copyWith(
                            height: 1.10,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        DateFormat('dd MMMM, yyyy').format(newsModel.date??DateTime.now()),
                        style: CustomTextStyles.bodyLargeOnPrimary,
                      ),
                    ],
                  ),
                ],
              ),
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
      ),
    );
  }
}

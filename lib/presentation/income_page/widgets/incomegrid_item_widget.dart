import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../data/data_manager.dart';
import '../../../data/models/wallet_model.dart';

// ignore: must_be_immutable
class IncomegridItemWidget extends StatefulWidget {
  IncomegridItemWidget(
    this.incomeModel, {
    Key? key,
  }) : super(
          key: key,
        );

  IncomeModel incomeModel;

  @override
  State<IncomegridItemWidget> createState() => _IncomegridItemWidgetState();
}

class _IncomegridItemWidgetState extends State<IncomegridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, AppRoutes.infoIncomeScreen,
                arguments: widget.incomeModel)
            .then((value) => {
                  setState(() {
                    DataManager.getIncomeModel(widget.incomeModel);
                  }),
                }),
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.fillGray100.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(16.h),
              child: CustomImageView(
                imagePath: widget.incomeModel?.icon,
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              widget.incomeModel.name!,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 33.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        widget.incomeModel.amount.toStringAsFixed(2)!,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(left: 8.h),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

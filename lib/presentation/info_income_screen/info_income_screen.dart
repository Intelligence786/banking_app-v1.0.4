import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/wallet_model.dart';
import 'package:banking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:banking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:banking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:banking_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class InfoIncomeScreen extends StatefulWidget {
  final IncomeModel incomeModel;

  InfoIncomeScreen({Key? key, required this.incomeModel})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context, IncomeModel incomeModel) {
    return InfoIncomeScreen(
      incomeModel: incomeModel,
    );
  }

  @override
  State<InfoIncomeScreen> createState() => _InfoIncomeScreenState();
}

class _InfoIncomeScreenState extends State<InfoIncomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        // width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 3.v,
        ),
        child: Column(
          children: [
            _buildTopWidget(context),
            SizedBox(height: 31.v),
            (widget.incomeModel.incomeHistory?.length ?? 0) > 0
                ? Expanded(child: _buildFull(context))
                : Expanded(child: _buildEmpty(context)),
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
        margin: EdgeInsets.all(8.h)
      ),
      title: AppbarSubtitle(
        text: "lbl_income".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          height: 56.adaptSize,
          width: 56.adaptSize,
          padding: EdgeInsets.all(16.h),
          child: CustomImageView(
            imagePath: widget.incomeModel.icon,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            bottom: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.incomeModel.name,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 5.v),
              Text(
                widget.incomeModel.amount.toStringAsFixed(2),
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 16.v),
          child: CustomIconButton(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.addIncomeScreen,
                      arguments: widget.incomeModel)
                  .then((value) => {
                        setState((){
                          DataManager.getIncomeModel(widget.incomeModel);
                        }),
                      });
            },
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.fillGray,
            child: CustomImageView(
              imagePath: ImageConstant.imgOtherIconsOnprimary40x40,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildIncomeHistory(
      BuildContext context, IncomeHistory incomeHistory) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 56.adaptSize,
            width: 56.adaptSize,
            padding: EdgeInsets.all(16.h),
            child: CustomImageView(
              imagePath: widget.incomeModel.icon,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 7.v,
              bottom: 7.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incomeHistory.title,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 3.v),
                Text(
                  '${incomeHistory.amount.toStringAsFixed(2)} \$',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 16.v),
          ),
        ],
      ),
    );
  }

  Widget _buildFull(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "lbl_income".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 10.v,
              );
            },
            itemCount: widget.incomeModel.incomeHistory.length,
            itemBuilder: (context, index) {
              IncomeHistory model = widget.incomeModel.incomeHistory[index] ??
                  IncomeHistory(amount: 0);
              return _buildIncomeHistory(context, model);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBxsInfoSquareSvg,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          SizedBox(height: 8.v),
          SizedBox(
            //width: 234.h,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "msg_no_information_on2".tr,
                    style: CustomTextStyles.bodyLargeSecondaryContainer_1,
                  ),
                  TextSpan(
                    text: "msg_lick_on_the_add".tr,
                    style: CustomTextStyles.bodyLargeSecondaryContainer_1,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

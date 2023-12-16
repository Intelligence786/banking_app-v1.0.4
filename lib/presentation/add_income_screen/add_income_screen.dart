import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/data_manager.dart';
import 'package:banking_app/data/models/wallet_model.dart';
import 'package:banking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:banking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:banking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:banking_app/widgets/custom_elevated_button.dart';
import 'package:banking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
   final IncomeModel incomeModel;

  AddIncomeScreen({Key? key, required this.incomeModel})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context, IncomeModel incomeModel) {
    return AddIncomeScreen(
      incomeModel: incomeModel,
    );
  }

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  TextEditingController priceController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  FocusNode priceFocus = FocusNode();

  FocusNode salaryFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context, widget.incomeModel.name),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_add_income".tr,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 22.v),
              Text(
                "msg_income_description".tr,
                style: CustomTextStyles.titleMediumBlack900,
              ),
              SizedBox(height: 16.v),
              CustomTextFormField(
                focusNode: salaryFocus,
                controller: salaryController,
                hintText: "lbl_salary".tr,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20.v),
              Text(
                "lbl_income_amount".tr,
                style: CustomTextStyles.titleMediumBlack900,
              ),
              SizedBox(height: 18.v),
              CustomTextFormField(
                prefix: Container(
                  height: 20.h,
                  width: 20.h,
                  child: Center(
                    child: Text(
                      '\$',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
                //prefixConstraints: BoxConstraints.expand(width: 40, height: ),
                focusNode: priceFocus,
                controller: priceController,
                hintText: '0.00',
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                text: "lbl_add_income".tr,
                onPressed: () {
                  IncomeHistory incomeHistory = IncomeHistory(
                    title: salaryController.value.text,
                    amount: double.parse(priceController.value.text),
                  );
                  widget.incomeModel.incomeHistory.add(incomeHistory);
                  widget.incomeModel.amount += incomeHistory.amount;
                  setState(() {

                    DataManager.addOrUpdateIncome(widget.incomeModel);
                  });

                  //widget.incomeModel.incomeHistory.add(incomeHistory);

                  Navigator.pop(context, true);
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context, String title) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgOtherIconsOnprimary,
          margin: EdgeInsets.all(8.h),
      ),
      title: AppbarSubtitle(
        text: title,
        margin: EdgeInsets.only(left: 8.h),
      ),
    );
  }
}

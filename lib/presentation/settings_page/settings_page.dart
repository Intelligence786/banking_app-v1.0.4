import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          // vertical: 43.v,
        ),
        child: Column(
          children: [
            SizedBox(height: 46.v),
            _buildSettingsItem(
              context,
              imgUrl: ImageConstant.imgShareWithFriends,
              title: 'msg_share_with_friends'.tr,
              onTap: () {},
            ),
            SizedBox(height: 24.v),
            _buildSettingsItem(
              context,
              imgUrl: ImageConstant.imgPrivacyPolicy ,
              title: 'lbl_privacy_policy'.tr,
              onTap: () {},
            ),
            SizedBox(height: 24.v),
            _buildSettingsItem(
              context,
              imgUrl: ImageConstant.imgTermsOfUse,
              title: 'lbl_terms_of_use'.tr,
              onTap: () {},
            ),
            SizedBox(height: 24.v),
            _buildSettingsItem(
              context,
              imgUrl: ImageConstant.imgSubscriptionInfo,
              title: 'msg_subscription_info'.tr,
              onTap: () {},
            ),
            SizedBox(height: 24.v),
            _buildSettingsItem(
              context,
              imgUrl: ImageConstant.imgLogout,
              title: 'lbl_logout'.tr,
              onTap: () {},
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildSettingsItem(BuildContext context,
      {String? imgUrl, String? title, Function? onTap}) {
    return InkWell(
      onTap: onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillYellowA,
              child: CustomImageView(
                imagePath: imgUrl,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 11.v,
                bottom: 9.v,
              ),
              child: Text(
                title ?? '',
                style: CustomTextStyles.bodyLargeOnPrimary,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 8.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}

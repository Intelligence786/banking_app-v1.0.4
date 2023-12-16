import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_segmented_progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();

  List<Map<String, String>> onboardingData = [
    {
      'image': ImageConstant.imgFirstOnboarding,
      'headText': "msg_first_onboarding_head".tr,
      'descText': "msg_first_onboarding_body".tr,
    },
    {
      'image': ImageConstant.imgSecondOnboarding,
      'headText': "msg_second_onboarding_head".tr,
      'descText': "msg_second_onboarding_body".tr,
    },
    {
      'image': ImageConstant.imgThirdOnboarding,
      'headText': "msg_third_onboarding_head".tr,
      'descText': "msg_third_onboarding_body".tr,
    },
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.yellowA700,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: _buildImage(
                context,
                onboardingData[index]['image'] ?? '',
              ),
            ),
          ),
          Container(
            decoration: AppDecoration.fillGrayOpacity1,
          ),
          Container(
              decoration: AppDecoration.gradientOnPrimaryContainerToBlack,
              child: _buildBottom(context)),
          // _buildBottom(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imagePath) {
    return CustomImageView(
        fit: BoxFit.contain,
        imagePath: imagePath,
        height: 24.adaptSize,
        width: 24.adaptSize);
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context) {
    return CustomSegmentedProgressBar(
      activeColor: appTheme.gray100,
      unactiveColor: appTheme.gray500,
      //padding: EdgeInsets.only(bottom: 50.h, top: 50.h),
      count: 3,
      index: currentPage,
    );
  }

  /// Section Widget
  Widget _buildBottom(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 26.v),
      //decoration: AppDecoration.gradientOnPrimaryContainerToBlack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 11.v),
          Text(onboardingData[currentPage]['headText'] ?? '',
              textAlign: TextAlign.center,
              style: CustomTextStyles.headlineLargeGray100),
          SizedBox(height: 10.v),
          Container(
            //width: 300.h,
            margin: EdgeInsets.only(left: 1.h, right: 1.h),
            child: Text(
              onboardingData[currentPage]['descText'] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeSecondaryContainer.copyWith(
                height: 1.38,
              ),
            ),
          ),
          Container(
              height: 50.h,
              //width: 200.h,
              child: _buildFrameRow(context)),
          SizedBox(height: 40.v),
          CustomElevatedButton(
              text: currentPage == onboardingData.length - 1
                  ? "Get started"
                  : "Next",
              onPressed: () {
                navigateToOnboarding(context);
              }),
          SizedBox(height: 20.v),
          SizedBox(
            width: 200.h,
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "\n",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "Terms of use",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "  |  ",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: theme.textTheme.bodyMedium,
                  )
                ]),
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }

  /// Navigates to the educationScreen when the action is triggered.
  navigateToOnboarding(BuildContext context) {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushNamed(context, AppRoutes.appNavigationScreen, arguments: 0);
    } else {
      // Переход на следующую стадию
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}

import 'package:banking_app/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imageHomeInactive,
      activeIcon: ImageConstant.imageHomeActive,
      label: 'Home',
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imageIncomeInactive,
      activeIcon: ImageConstant.imageIncomeActive,
      label: 'Income',
      type: BottomBarEnum.Income,
    ),
    BottomMenuModel(
      icon: ImageConstant.imageNewsInactive,
      activeIcon: ImageConstant.imageNewsActive,
      label: 'News',
      type: BottomBarEnum.News,
    ),
    BottomMenuModel(
      icon: ImageConstant.imageSettingsInactive,
      activeIcon: ImageConstant.imageSettingsActive,
      label: 'Settings',
      type: BottomBarEnum.Settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(
          18.h,
        ),

      ),
      child: BottomNavigationBar(
        //backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: theme.textTheme.displaySmall?.copyWith(color: theme.colorScheme.primary),
        unselectedLabelStyle: theme.textTheme.displaySmall?.copyWith(color: theme.colorScheme.background),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              //color: appTheme.,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              // color: theme.colorScheme.primaryContainer,
            ),
            label: bottomMenuList[index].label,
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum { Home, Income, News, Settings }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    required this.label,
  });

  String icon;

  String activeIcon;

  String label;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

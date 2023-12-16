
import 'package:banking_app/presentation/income_page/income_page.dart';
import 'package:banking_app/presentation/main_page/main_page.dart';
import 'package:banking_app/presentation/news_page/news_page.dart';
import 'package:banking_app/presentation/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../widgets/custom_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  late final int indexToRoute;
  final List<Widget> screens = [
    MainPage(),
    IncomePage(),
    NewsPage(),
    SettingsPage(),
  ];

  NavigationScreen({key, this.indexToRoute = 0});

  static Widget builder(BuildContext context) {
    return NavigationScreen();
  }

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _currentIndex = widget.indexToRoute;

  late final _theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // widget.screens[_currentIndex],
          widget.screens[_currentIndex],
      bottomNavigationBar:  _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _currentIndex = type.index;
      setState(() {});
      // Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  String _buildAppBarTitle() {
    String title = '';
    switch (_currentIndex) {
      case 0:
        title = "Welcome to your\nFinancial assistant";

        break;
      case 1:
        title = "Let`s start your\neducation";

        break;
      case 2:
        title = "Take control\nyour income";
        break;
      case 3:
        title = "Take control\nyour expenses";
        break;
      case 4:
        title = "Follow\nbusiness news";
        break;
      default:
        break;
    }

    return title;
  }
}

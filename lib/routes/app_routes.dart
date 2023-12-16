import 'package:banking_app/data/models/news_model.dart';
import 'package:banking_app/presentation/add_income_screen/add_income_screen.dart';
import 'package:banking_app/presentation/info_income_screen/info_income_screen.dart';
import 'package:banking_app/presentation/navigation_screen.dart';
import 'package:banking_app/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../data/models/wallet_model.dart';
import '../presentation/news_view_screen/news_view_screen.dart';

class AppRoutes {


  static const String onboardingScreen = '/onboarding_screen';

  static const String mainScreen = '/main_screen';



  static const String settingsScreen = '/settings_screen';

  static const String incomeScreen = '/income_screen';

  static const String infoIncomeScreen = '/info_income_screen';


  static const String addIncomeScreen = '/add_income_screen';


  static const String newsScreen = '/news_screen';

  static const String newsViewScreen = '/news_view_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        infoIncomeScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as IncomeModel;
          return InfoIncomeScreen.builder(context, arguments);
        },
        addIncomeScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as IncomeModel;
          return AddIncomeScreen.builder(context, arguments);
        },
        newsViewScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as NewsModel;
          return NewsViewScreen.builder(context, arguments);
        },
        appNavigationScreen: NavigationScreen.builder,
        initialRoute: OnboardingScreen.builder
      };
}

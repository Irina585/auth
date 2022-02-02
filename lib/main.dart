import 'package:auth/drawer_menu/cards.dart';
import 'package:auth/drawer_menu/offers.dart';
import 'package:auth/drawer_menu/promotions.dart';
import 'package:auth/resources/app_colors.dart';
import 'package:auth/auth/auth.dart';
import 'package:auth/lake.dart';
import 'package:auth/screen.dart';
import 'package:auth/user_list/userID_list_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Авторизация',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.mainDartBlue),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDartBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade400)),
      initialRoute: '/screen',
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/screen': (context) => const Screen(),
        '/lake_page': (context) => const LikePage(),
        '/cards': (context) => const CardPage(),
        '/promotions': (context) => const PromotionsPage(),
        '/offers': (context) => const PersonalOffersPage(),
        '/userID': (context) => const UserIDListWidget(),
      },
    );
  }
}


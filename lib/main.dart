import 'package:flutter/material.dart';
import 'package:islami_app_route/providers/settings_provider.dart';
import 'package:islami_app_route/providers/settings_provider.dart';
import 'package:islami_app_route/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_app_route/screens/home/home_screen.dart';
import 'package:islami_app_route/screens/sura_details/sura_details_screen.dart';
import 'package:islami_app_route/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Islami',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      //home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}

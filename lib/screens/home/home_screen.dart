import 'package:flutter/material.dart';
import 'package:islami_app_route/screens/home/hadeth/hadeth_tab.dart';
import 'package:islami_app_route/screens/home/quran/quran_tab.dart';
import 'package:islami_app_route/screens/home/radio/radio_tab.dart';
import 'package:islami_app_route/screens/home/sebha/sebha_tab.dart';
import 'package:islami_app_route/screens/home/settings/settings_tap.dart';
import 'package:islami_app_route/theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                 settingsProvider.getMainBAckgroundImage()
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newlySelectedIndex){
            setState(() {
              selectedIndex = newlySelectedIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: 'Quran'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                label: 'Hadeth'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: 'Tasbeh'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: 'Radio'),
            const BottomNavigationBarItem(
                icon:Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];
}

import 'package:flutter/material.dart';
import 'package:islami_app_route/providers/settings_provider.dart';
import 'package:islami_app_route/theme/my_theme.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0.0;
  int currentIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: mediaQuery.height * 0.39,
            child: Stack(
              children: [
                Positioned(
                  left: mediaQuery.width * 0.46,
                  child: Image.asset(
                    settingProvider.isDarkMode()
                        ? 'assets/images/head_of_seb7a_dark.png'
                        : 'assets/images/head_of_seb7a.png',
                    height: mediaQuery.height * 0.1,
                  ),
                ),
                Positioned(
                  top: 55,
                  left: mediaQuery.width * 0.2,
                  child: GestureDetector(
                    onTap: () {
                      onClick();
                    },
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          settingProvider.isDarkMode()
                              ? 'assets/images/body_of_seb7a_dark.png'
                              : 'assets/images/body_of_seb7a.png',
                          height: mediaQuery.height * 0.28,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'عدد  التسبيحات',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 29, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30),
          Container(
            width: 70,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              counter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              azkar[currentIndex],
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  onClick() {
    setState(() {
      counter++;
      angle--;
      if (counter == 33) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}

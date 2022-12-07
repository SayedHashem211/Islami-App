import 'package:flutter/material.dart';
import 'package:islami_app_route/screens/home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../providers/settings_provider.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme',
          style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 8,),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                 border: Border.all(
                   color: Theme.of(context).accentColor,
                   width: 1
                 )
              ),
              child: Text(
              settingsProvider.selectedTheme()
              ,
              style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Text('Language',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 8,),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 1
                )
            ),
            child: Text('English',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context,
        builder:(buildContext){
      return const ThemeBottomSheet();
        }
    );
  }
}

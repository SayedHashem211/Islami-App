import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/settings_provider.dart';


class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                settingsProvider.changeTheme(ThemeMode.light);
              },
              child:
              settingsProvider.isDarkMode()?
              getUnSelectedItem('Light') :
          getSelectedItem('Light')
          ),
          const SizedBox(height: 12,),
          InkWell(
              onTap: (){
                settingsProvider.changeTheme(ThemeMode.dark);
              },
              child:
              settingsProvider.isDarkMode() ?
              getSelectedItem('Dark'):
             getUnSelectedItem('Dark')
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Theme.of(context).accentColor
          ),
        ),
        Icon(Icons.check,
          color: Theme.of(context).accentColor,),
      ],
    );
  }

  Widget getUnSelectedItem(String title){
    return  Text(title ,
      style:Theme.of(context).textTheme.headline4 ,
    );
  }
}

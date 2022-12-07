import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';
import '../home/hadeth/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    // recieve arguments
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBAckgroundImage()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Card(

            elevation: 12,
            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(args.content,
                textDirection: TextDirection.rtl,
                style:Theme.of(context).textTheme.headline6,
                ),
              ),
            )
          ),
        ),
      ),
    );

  }
}

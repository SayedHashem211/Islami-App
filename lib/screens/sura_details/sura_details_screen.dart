import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/screens/sura_details/sura_details_args.dart';
import 'package:islami_app_route/screens/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {

  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses = [];

  @override
  Widget build(BuildContext context) {
    // recieve args from sura title widget
    SuraDetailsScreenArgs args = ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs; // down casting (convert from pointer of type object to pointer of type SuraDetailsScreenArgs)
    if (verses.isEmpty)
      readFile(args.index+1); // works لوحدها , it won't block my code
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBAckgroundImage()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name),
        ),
        body: verses.isEmpty?
        const Center(
          child: CircularProgressIndicator(),
        )
        :
        Card(
          elevation: 12,
          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(itemBuilder: (context , index){
            return VerseWidget(verses[index],index+1);
          },
            itemCount: verses.length,
            separatorBuilder: (context,index){
            return Container(
              color: Theme.of(context).accentColor,
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 64),
            );
            },
          ),
        ),
      ),
    );

  }

  // To read files from assets
  void readFile(int fileIndex)async{
   String fileContent = await rootBundle.loadString('assets/files/$fileIndex.txt');
   List<String> lines = fileContent.trim().split('\n');
   //print (lines);
    setState(() {
      verses = lines;
    });
  }
}




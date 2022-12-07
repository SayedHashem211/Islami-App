import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/screens/home/hadeth/hadeth_model.dart';

import 'hadeth_title_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List <Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty)
    loadHadethFile();
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_icon_image.png'),
          Expanded(
            child: ListView.separated(itemBuilder: (context , index){
              return HadethTitleWidget (allHadethList[index]);
            },
              itemCount: allHadethList.length,
              separatorBuilder: (context,index){
                return Container(
                  color: Theme.of(context).accentColor,
                  width: double.infinity,
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 64),
                );
              },
            ),
          ),
        ],
      )
    );
  }

  void loadHadethFile() async {
    List <Hadeth> hadethList = [];

    String content = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> allHadethContent = content.split("#");
    for (int i=0; i< allHadethContent.length; i++){
      String singleHadeth = allHadethContent[i].trim();
      // int indexOfFirstLine = singleHadeth.indexOf("/n");
      // String title = singleHadeth.substring(0,indexOfFirstLine);
      // String content = singleHadeth.substring(indexOfFirstLine+1);

     // Hadeth h =  new Hadeth(title, content);  // object from data class

      //hadethList.add(h);




      List<String> singleHadethLines = singleHadeth.trim().split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join("\n");

      Hadeth h =  new Hadeth(title, content);  // object from data class

      hadethList.add(h);

    }
    allHadethList = hadethList;
    setState(() {

    });
  }
}

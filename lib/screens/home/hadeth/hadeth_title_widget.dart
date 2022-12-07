import 'package:flutter/material.dart';

import '../../hadeth_details/hadeth_details.dart';
import '../../sura_details/sura_details_args.dart';
import '../../sura_details/sura_details_screen.dart';
import 'hadeth_model.dart';

class HadethTitleWidget extends StatelessWidget {

  Hadeth hadeth; // obj from data class

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName , arguments: hadeth);
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(
          hadeth.title, style: Theme.of(context).textTheme.headline4,
        ),
        ),
    );
  }
}

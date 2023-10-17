import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/layout/hadeth/hadeth_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = "HadethTab";
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadethcontent> allhadeth = [];
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);

    if (allhadeth.isEmpty) readfile();
    return Column(
      children: [
        Image.asset(
            "Assets/image/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png"),
        pro.appMode == ThemeMode.dark
            ? Divider(
                thickness: 3,
                height: 10,
                endIndent: 10,
                indent: 10,
                color: ThemeApp.selectedInDarkMode,
              )
            : Divider(
                thickness: 3,
                height: 10,
                endIndent: 10,
                indent: 10,
                color: Theme.of(context).primaryColor,
              ),
        Text(
          AppLocalizations.of(context)!.hadeth,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        pro.appMode == ThemeMode.dark
            ? Divider(
                thickness: 3,
                height: 10,
                endIndent: 10,
                indent: 10,
                color: ThemeApp.selectedInDarkMode,
              )
            : Divider(
                thickness: 3,
                height: 10,
                endIndent: 10,
                indent: 10,
                color: Theme.of(context).primaryColor,
              ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetales.RouteNAme,
                    arguments: Hadethcontent(
                        title: allhadeth[index].title,
                        content: allhadeth[index].content));
              },
              child: pro.appMode == ThemeMode.dark
                  ? Text(
                      allhadeth[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    )
                  : Text(
                      allhadeth[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
            ),
            itemCount: allhadeth.length,
          ),
        ),
      ],
    );
  }

  readfile() async {
    var text = await rootBundle.loadString("Assets/files/ahadeth.txt");
    List<String> allHeadth = text.split("#");
    for (int i = 0; i < allHeadth.length; i++) {
      String singleHeadth = allHeadth[i].trim();
      int indexoffirstline = singleHeadth.indexOf("\n");
      String title = singleHeadth.substring(0, indexoffirstline);
      String content = singleHeadth.substring(indexoffirstline + 1);
      Hadethcontent hadethcontent =
          Hadethcontent(title: title, content: content);
      setState(() {
        allhadeth.add(hadethcontent);
      });
    }
  }
}

class Hadethcontent {
  String title;
  String content;
  Hadethcontent({required this.title, required this.content});
}

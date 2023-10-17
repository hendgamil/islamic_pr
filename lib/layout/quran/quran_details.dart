import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/layout/quran/quran_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class QuranDetails extends StatefulWidget {
  static const routeName = "Quran_Details";

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String content = "";
  List<String> allverses = [];
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    var mediaquary = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as Quran;
    if (content.isEmpty) readfiles(args.suraNumber);
    return Stack(
      children: [
        pro.appMode == ThemeMode.dark
            ? Image.asset(
                "Assets/image/main_background_DArk.png",
                fit: BoxFit.cover,
                height: mediaquary.height,
                width: mediaquary.width,
              )
            : Image.asset(
                "Assets/image/bg3 (1).png",
                fit: BoxFit.cover,
                height: mediaquary.height,
                width: mediaquary.width,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "إسلامي",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: pro.appMode == ThemeMode.dark
              ? Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 25,
                    bottom: 30,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                      color: ThemeApp.primaryDark.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "  سورة ${args.suraName}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ThemeApp.selectedInDarkMode,
                                ),
                          ),
                          SizedBox(
                            width: 34,
                          ),
                          Icon(
                            Icons.play_circle_fill,
                            color: ThemeApp.selectedInDarkMode,
                            size: 32,
                          ),
                        ],
                      ),
                      Divider(
                        color: ThemeApp.selectedInDarkMode,
                        endIndent: 50,
                        indent: 50,
                        thickness: 2,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              "${allverses[index]}(${index + 1})",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            );
                          },
                          itemCount: allverses.length,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 25,
                    bottom: 30,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8F8).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "  سورة ${args.suraName}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            width: 34,
                          ),
                          Icon(
                            Icons.play_circle_fill,
                            size: 32,
                          ),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                        endIndent: 50,
                        indent: 50,
                        thickness: 2,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              "${allverses[index]}(${index + 1})",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            );
                          },
                          itemCount: allverses.length,
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  readfiles(String index) async {
    var text = await rootBundle.loadString("Assets/files/$index.txt");
    content = text;
    setState(() {
      allverses = content.split("\n");
    });
    print(text);
  }
}

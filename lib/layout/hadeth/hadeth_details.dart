import 'package:flutter/material.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/layout/hadeth/hadeth_screen.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetales extends StatelessWidget {
  static const String RouteNAme = "jnhj";
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadethcontent;
    var pro = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      pro.appMode == ThemeMode.dark
          ? Image.asset("Assets/image/main_background_DArk.png")
          : Image.asset("Assets/image/bacground_home_screen.png"),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "اسلامى",
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
                          args.title,
                          style: Theme.of(context).textTheme.titleMedium,
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
                      child: SingleChildScrollView(
                        child: Text(
                          args.content,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
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
                          args.title,
                          style: Theme.of(context).textTheme.titleMedium,
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
                      child: SingleChildScrollView(
                        child: Text(
                          args.content,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ]);
  }
}

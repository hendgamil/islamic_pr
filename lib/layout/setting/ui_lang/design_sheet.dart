import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class sheetdesign extends StatelessWidget {
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            pro.ChangeLAng('en');
          },
          child: pro.AppLang == 'en'
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.english)
              : getunselectedItemWidget(
                  context, AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: () {
            pro.ChangeLAng('ar');
          },
          child: pro.AppLang == 'ar'
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.arabic)
              : getunselectedItemWidget(
                  context, AppLocalizations.of(context)!.arabic),
        )
      ],
    );
  }

  getSelectedItemWidget(context, String text) {
    var pro = Provider.of<AppConfigProvider>(context);
    return pro.appMode == ThemeMode.dark
        ? Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ThemeApp.selectedInDarkMode,
                        ),
                  ),
                ),
                Icon(Icons.check, color: ThemeApp.selectedInDarkMode),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                Icon(Icons.check, color: Theme.of(context).primaryColor),
              ],
            ),
          );
  }

  getunselectedItemWidget(context, String text) {
    var pro = Provider.of<AppConfigProvider>(context);
    return pro.appMode == ThemeMode.dark
        ? Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(text, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:Colors.black,
                )),
              ],
            ),
          );
  }
}

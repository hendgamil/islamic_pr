import 'package:flutter/material.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_config_provider.dart';

class DesignSheetTheme extends StatelessWidget {
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            pro.ChangeTheme(ThemeMode.light);
          },
          child: pro.appMode == ThemeMode.light
              ? getSelectedItemWidget(context, "Light")
              : getunselectedItemWidget(context, "light"),
        ),
        InkWell(
          onTap: () {
            pro.ChangeTheme(ThemeMode.dark);
          },
          child: pro.appMode == ThemeMode.dark
              ? getSelectedItemWidget(context, "Dark")
              : getunselectedItemWidget(context, "Dark"),
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
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
  }
}

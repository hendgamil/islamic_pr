import 'package:flutter/material.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class QuranItem extends StatelessWidget {
  var SuraName;
  var SuraNumber;
  QuranItem({required this.SuraName, required this.SuraNumber});
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        pro.appMode == ThemeMode.dark
            ? Expanded(
                child: Text(
                  "$SuraNumber",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            : Expanded(
                child: Text(
                  "$SuraNumber",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
        pro.appMode == ThemeMode.dark
            ? Container(
                width: 1.2,
                height: 40,
                color: ThemeApp.selectedInDarkMode,
              )
            : Container(
                width: 1.2,
                height: 40,
                color: Theme.of(context).primaryColor,
              ),
        pro.appMode == ThemeMode.dark
            ? Expanded(
                child: Text(
                  "$SuraName",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            : Expanded(
                child: Text(
                  "$SuraName",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
      ],
    );
  }
}

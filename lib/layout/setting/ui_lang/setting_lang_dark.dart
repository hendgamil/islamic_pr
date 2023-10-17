import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';
import 'desig_sheet_theme/design_sheet_Theme.dart';
import 'design_sheet.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        InkWell(
          onTap: () {
            opensheet(context);
          },
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  pro.AppLang == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        InkWell(
          onTap: () {
            opensheettheme(context);
          },
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  pro.appMode == ThemeMode.dark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        )
      ],
    );
  }

  void opensheet(context) {
    showModalBottomSheet(context: context, builder: (context) => sheetdesign());
  }

  void opensheettheme(context) {
    showModalBottomSheet(
        context: context, builder: (context) => DesignSheetTheme());
  }
}

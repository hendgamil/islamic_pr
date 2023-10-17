import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_pr/layout/hadeth/hadeth_screen.dart';
import 'package:islamic_pr/layout/quran/quran_screen.dart';
import 'package:islamic_pr/layout/radio/radio_screen.dart';
import 'package:islamic_pr/layout/setting/ui_lang/setting_lang_dark.dart';
import 'package:islamic_pr/layout/tasbeh/tasbeh_screen.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var mediaquary = MediaQuery.of(context).size;
    return Stack(
      children: [
        provider.appMode == ThemeMode.dark
            ? Image.asset(
                "Assets/image/main_background_DArk.png",
                width: mediaquary.width,
                height: mediaquary.height,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "Assets/image/bg3 (1).png",
                width: mediaquary.width,
                height: mediaquary.height,
                fit: BoxFit.cover,
              ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: tabs[selectedindex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("Assets/image/Quran.png"),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("Assets/image/Group 6-1.png"),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("Assets/image/sebha-1.png"),
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("Assets/image/radio-1.png"),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settinng),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuraTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    AppSettings(),
  ];
}

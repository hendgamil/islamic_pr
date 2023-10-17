import 'package:flutter/material.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    var mediaqyar = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: mediaqyar.height * 0.13),
          child: Image.asset(
            "Assets/image/radio.png",
            height: mediaqyar.height * 0.20,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        pro.appMode == ThemeMode.dark
            ? Text(
                "إذاعة القرآن الكريم",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              )
            : Text(
                "إذاعة القرآن الكريم",
                style: Theme.of(context).textTheme.titleMedium,
              ),
        SizedBox(
          height: 60,
        ),
        pro.appMode == ThemeMode.dark
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageIcon(AssetImage("Assets/image/Icon metro-next.png"),
                      color: ThemeApp.selectedInDarkMode),
                  ImageIcon(AssetImage("Assets/image/Icon awesome-play.png"),
                      color: ThemeApp.selectedInDarkMode),
                  ImageIcon(AssetImage("Assets/image/Icon metro-next (1).png"),
                      color: ThemeApp.selectedInDarkMode),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageIcon(AssetImage("Assets/image/Icon metro-next.png"),
                      color: Theme.of(context).primaryColor),
                  ImageIcon(AssetImage("Assets/image/Icon awesome-play.png"),
                      color: Theme.of(context).primaryColor),
                  ImageIcon(AssetImage("Assets/image/Icon metro-next (1).png"),
                      color: Theme.of(context).primaryColor),
                ],
              ),
      ],
    );
  }
}

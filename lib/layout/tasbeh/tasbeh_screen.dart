import 'package:flutter/material.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int Conter = 0;
  double angle = 0;
  List<String> text = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];
  int index = 0;

  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    var mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: mediaquary.width,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: mediaquary.height * 0.09),
                child: Transform.rotate(
                  angle: angle,
                  child: Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        clickedonImage();
                      },
                      child: pro.appMode == ThemeMode.dark
                          ? Image.asset(
                              "Assets/image/body of seb7a.png",
                              height: mediaquary.height * 0.20,
                            )
                          : Image.asset(
                              "Assets/image/body .png",
                              height: mediaquary.height * 0.20,
                            ),
                    ),
                  ),
                ),
              ),
              pro.appMode == ThemeMode.dark
                  ? Container(
                      margin: EdgeInsets.only(left: mediaquary.width * 0.07),
                      child: Image.asset(
                        "Assets/image/head_of_dark.png",
                        height: mediaquary.height * 0.10,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: mediaquary.width * 0.07),
                      child: Image.asset(
                        "Assets/image/head.png",
                        height: mediaquary.height * 0.10,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "عدد التسبيحات",
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: theme.primaryColor),
              borderRadius: BorderRadius.circular(30),
              color: theme.primaryColor,
            ),
            child: Center(
              child: Text(
                "$Conter",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          pro.appMode == ThemeMode.dark
              ? Container(
                  margin: EdgeInsets.only(
                      left: mediaquary.width * 0.32,
                      right: mediaquary.width * 0.32),
                  padding: EdgeInsets.only(
                      top: mediaquary.height * 0.01,
                      bottom: mediaquary.height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(color: ThemeApp.selectedInDarkMode),
                    borderRadius: BorderRadius.circular(25),
                    color: ThemeApp.selectedInDarkMode,
                  ),
                  child: Center(
                    child: Text(
                      text[index],
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                      left: mediaquary.width * 0.32,
                      right: mediaquary.width * 0.32),
                  padding: EdgeInsets.only(
                      top: mediaquary.height * 0.01,
                      bottom: mediaquary.height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: theme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      text[index],
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
          SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }

  void clickedonImage() {
    angle += 3;
    if (Conter == 30) {
      Conter = 0;
      text[index++];
    }
    if (index > 2) {
      index = 0;
    }
    Conter++;

    setState(() {});
  }
}

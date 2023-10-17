import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/layout/quran/quran_details.dart';
import 'package:islamic_pr/layout/quran/quran_item.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class QuraTab extends StatelessWidget {
  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Image.asset("Assets/image/Screenshot (1) (1).png"),
        pro.appMode == ThemeMode.dark
            ? Divider(
                color: ThemeApp.selectedInDarkMode,
                thickness: 2,
              )
            : Divider(
                color: ThemeApp.primaryLight,
                thickness: 2,
              ),
        Row(
          children: [
            pro.appMode == ThemeMode.dark
                ? Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.sura_number,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.sura_number,
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
                    color: ThemeApp.primaryLight,
                  ),
            pro.appMode == ThemeMode.dark
                ? Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.sura_name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.sura_name,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
        pro.appMode == ThemeMode.dark
            ? Divider(
                color: ThemeApp.selectedInDarkMode,
                thickness: 2,
              )
            : Divider(
                color: ThemeApp.primaryLight,
                thickness: 2,
              ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, QuranDetails.routeName,
                      arguments: Quran(
                          suraName: names[index], suraNumber: "${index + 1}"));
                },
                child: QuranItem(
                  SuraName: names[index],
                  SuraNumber: "${index + 1}",
                ),
              );
            },
            itemCount: names.length,
          ),
        )
      ],
    );
  }
}

class Quran {
  String suraName;
  String suraNumber;
  Quran({required this.suraName, required this.suraNumber});
}

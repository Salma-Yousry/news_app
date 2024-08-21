import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appcolors.dart';
import '../providers/app_config_provider.dart';
import 'lanuage_button_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 25
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showLanguageButtonSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryLightColor,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.primaryLightColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: AppColors.primaryLightColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void showLanguageButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Launguagebuttonsheet(),
    );
  }
}

import 'package:clean_artiticture_learning/core/utiles/strings/app_colors.dart';
import 'package:clean_artiticture_learning/core/widgets/appBar.dart';
import 'package:flutter/material.dart';

import '../../config/locale/app_localizations.dart';

class ErrorrWidget extends StatelessWidget {
  ErrorrWidget({required this.onPress});
  Function onPress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          const SizedBox(
            height: 110.0,
          ),
          Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.primaryColor,
              size: 160.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(AppLocalizations.of(context)!.translate('try_again')!,
              style:Theme.of(context).textTheme.bodyText1),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: 200.0,
            height: 55.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColors.primaryColor),
            child: TextButton(
              onPressed: () {
                onPress();
              },
              child: Text(
                AppLocalizations.of(context)!.translate( 'reload_screen')!  ,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

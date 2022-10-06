import 'package:clean_artiticture_learning/config/locale/app_localizations.dart';
import 'package:clean_artiticture_learning/features/splash_screen/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_routes.dart';
import '../../features/random_quote/presentiation/cubit/quote_cubit.dart';
import '../utiles/strings/app_colors.dart';
import '../utiles/strings/app_strings.dart';

PreferredSizeWidget MyAppBar(context) => AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.favoriteQouteRoute);
            },
            icon: Icon(Icons.favorite)),
        IconButton(
            onPressed: () {
              BlocProvider.of<LocaleCubit>(context).changeModeMethod(
                  !BlocProvider.of<LocaleCubit>(context).checkMode);
            },
            icon: Icon(Icons.mode_night)),
        IconButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toArabic();
              } else
                BlocProvider.of<LocaleCubit>(context).toEnglish();
            },
            icon: Icon(Icons.language))
      ],
      backgroundColor: AppColors.primaryColor,
      title: Text( AppLocalizations.of(context)!.translate('app_name')!),
    );

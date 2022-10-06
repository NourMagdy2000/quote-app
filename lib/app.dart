import 'package:clean_artiticture_learning/config/locale/app_localizations_setup.dart';
import 'package:clean_artiticture_learning/config/routes/app_routes.dart';
import 'package:clean_artiticture_learning/config/themes/app_theme.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_colors.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/features/random_quote/presentiation/screens/quote_screen.dart';
import 'package:clean_artiticture_learning/features/splash_screen/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_artiticture_learning/features/random_quote/injection.dart'
    as inj;
import 'package:shared_preferences/shared_preferences.dart';

import 'features/favorite_quote/presentation/cubit/favorite_quote_cubit.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SharedPreferences sharedPreferences;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => inj.sl<LocaleCubit>()
                ..getSavedLang()
                ..getSavedMode()),
          BlocProvider(
              create: (context) =>
                  inj.sl<FavoriteQuoteCubit>()..createDataBase())
        ],
        child: BlocConsumer<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: BlocProvider.of<LocaleCubit>(context).checkMode
                  ? ThemeMode.light
                  : ThemeMode.dark,
              routes: routes,
              locale: BlocProvider.of<LocaleCubit>(context).locale,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}

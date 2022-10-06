

import 'package:clean_artiticture_learning/core/network/network_info.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/presentation/screens/favorites_quote_screen.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/data_resources/remote/random_quote_data_source.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/repositories/quote_reprository_impl.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:clean_artiticture_learning/features/random_quote/presentiation/cubit/quote_cubit.dart';
import 'package:clean_artiticture_learning/features/random_quote/presentiation/screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_artiticture_learning/features/random_quote/injection.dart'
    as inj;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart'as http;

import '../../features/splash_screen/presentation/screens/splash_screen.dart';
class Routes {
  static const String mainRoute = '/';
  static const String favoriteQouteRoute = '/favoriteQuote';
  static const String randomQuoteRoute = '/splashScreen';

}

////     Named Routing Method /////

final routes = {
  Routes.mainRoute: (context) =>const SplashScreen() ,
  Routes.favoriteQouteRoute: (context) => const Favorite_quote_screen()
  ,
  Routes.randomQuoteRoute:(context)=>BlocProvider(
      create: (context) => inj.sl<QuoteCubit>(
      ),
      child: const Quote_screen())
};

////     OnGenerated Routing Method /////

class App_routes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => Quote_screen());
      case Routes.favoriteQouteRoute:
        return MaterialPageRoute(
            builder: (context) => const Favorite_quote_screen());
      default:
        unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(child: Text('no route found')),
            ));
  }
}

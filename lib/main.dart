import 'package:clean_artiticture_learning/features/random_quote/injection.dart'as inj;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'features/random_quote/presentiation/cubit/bloc_observer.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await inj.init();
  BlocOverrides.runZoned(() {
    runApp(const QuoteApp());
  }, blocObserver: MyBlocObserver());
}

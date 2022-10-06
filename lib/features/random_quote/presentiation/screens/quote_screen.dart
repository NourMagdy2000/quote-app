import 'package:clean_artiticture_learning/config/locale/app_localizations.dart';
import 'package:clean_artiticture_learning/config/routes/app_routes.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_colors.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/constants.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/presentation/cubit/favorite_quote_cubit.dart';
import 'package:clean_artiticture_learning/features/random_quote/presentiation/widgets/quote_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/quote_cubit.dart';
import '../widgets/body_content.dart';

class Quote_screen extends StatefulWidget {
  const Quote_screen({Key? key}) : super(key: key);

  @override
  State<Quote_screen> createState() => _Quote_screenState();
}

class _Quote_screenState extends State<Quote_screen> {
  _getRandomQuote() => BlocProvider.of<QuoteCubit>(context).getRandomQuote();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, RandomQuoteState>(builder: (context, state) {
      if (state is QuoteLoadedState) {
        return Scaffold(
            appBar: MyAppBar(context),
            body: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Quote_content(quote: state.quoteModel),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.QuoteBackGround,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        BlocProvider.of<QuoteCubit>(context).getRandomQuote();
                      },
                      icon: Icon(Icons.refresh,
                          color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.QuoteBackGround,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        BlocProvider.of<FavoriteQuoteCubit>(context)
                            .insertToDataBase(
                                author: state.quoteModel.author,
                                quote: state.quoteModel.content,
                                time: DateTime.now().toString(),
                                type: 'From out side');
                      },
                      icon: Icon(Icons.favorite,
                          color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                )
              ],
            ));
      } else if (state is QuoteErrorState) {
        return ErrorrWidget(onPress: () => _getRandomQuote());
      } else {
        return Scaffold(
            appBar: MyAppBar(context),
            body: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('app_name')!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 220.0,
                ),
                SpinKitCircle(
                  color: AppColors.primaryColor,
                ),
              ],
            ));
      }
    });
  }
}

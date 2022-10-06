import 'package:clean_artiticture_learning/core/utiles/strings/app_colors.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/presentation/cubit/favorite_quote_cubit.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/presentation/widgets/fav_quote_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_artiticture_learning/features/random_quote/injection.dart'
    as inj;

class Favorite_quote_screen extends StatefulWidget {
  const Favorite_quote_screen({Key? key}) : super(key: key);

  @override
  State<Favorite_quote_screen> createState() => _Favorite_quote_screenState();
}

class _Favorite_quote_screenState extends State<Favorite_quote_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocConsumer<FavoriteQuoteCubit, FavoriteQuoteState>(
          listener: (context, state) {},
          builder: (context, state) => Column(
            children: [
              if (state is GetSuccessState)
                ListView.separated(
                    itemBuilder: (context, index) => FavQuoteItem(
                          favQuoteModel: state.favQuotes[index],
                        ),
                    separatorBuilder: (context, index) =>
                        Divider(thickness: 10.0, indent: 10.0, endIndent: 10.0),
                    itemCount: state.favQuotes.length)
            ],
          ),
        ),
      )
    ;
  }
}

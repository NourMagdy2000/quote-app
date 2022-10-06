import 'package:clean_artiticture_learning/features/random_quote/data/models/QuoteModel.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:flutter/material.dart';

import '../../../../core/utiles/strings/app_colors.dart';

class Quote_content extends StatelessWidget {
  const Quote_content({required this.quote});
  final QuoteEntities quote;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.QuoteBackGround,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                quote.content,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                   ,
                textAlign: TextAlign.center,
              ),
              Text(
               quote.author,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                  ,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

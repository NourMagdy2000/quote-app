import 'package:clean_artiticture_learning/features/favorite_quote/domain/entities/favorite_quote_entity.dart';
import 'package:flutter/material.dart';

import '../../data/models/favorite_quote.dart';

class FavQuoteItem extends StatelessWidget {
  final FavQuoteEntity favQuoteModel;
  FavQuoteItem({required this.favQuoteModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(favQuoteModel.author),
      subtitle: Text(favQuoteModel.quote),
    );
  }
}

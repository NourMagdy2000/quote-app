import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';

class QuoteModel extends QuoteEntities {
  String author;
  int id;
  String content;
  String permalink;

  QuoteModel(
      {required this.author,
      required this.id,
      required this.content,
      required this.permalink})
      : super(author: author, content: content, id: id, permalink: permalink);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
      author: json['author'],
      id: json['id'],
      content: json['quote'],
      permalink: json['permalink']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id;
    data['quote'] = this.content;
    data['permalink'] = this.permalink;
    return data;
  }
}

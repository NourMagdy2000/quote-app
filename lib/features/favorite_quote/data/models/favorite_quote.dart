import 'package:clean_artiticture_learning/features/favorite_quote/domain/entities/favorite_quote_entity.dart';

class FavQuoteModel extends FavQuoteEntity {
  int id;
  String quote;
  String author;
  String type;
  String time;
  FavQuoteModel(
      {required this.time,
        required this.id,
      required this.type,
      required this.author,
      required this.quote})
      : super(id: id, type: type, author: author, quote: quote,time:time );
  factory FavQuoteModel.fromJson(Map<String, dynamic> json) => FavQuoteModel(
      author: json['author'],
      id: json['id'],
      type: json['type'],
      quote: json['quote'],
  time: json['time']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['type'] = this.type;
    data['time'] = this.time;

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, author, quote, type];
}

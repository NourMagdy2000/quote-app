import 'package:equatable/equatable.dart';

class FavQuoteEntity extends Equatable {
 final int id;
 final String quote;
final  String author;
 final String type;
 final String time;
  FavQuoteEntity(
      {required this.time, required this.id,
      required this.type,
      required this.author,
      required this.quote});

  @override
  // TODO: implement props
  List<Object?> get props => [id, author, quote, type,time];
}

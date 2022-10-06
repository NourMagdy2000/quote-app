import 'package:equatable/equatable.dart';

class QuoteEntities extends Equatable {
  final int id;
  final String permalink;
 final String author;
  final String content;

  QuoteEntities({required this.id, required this.permalink, required this.author, required this.content});

  @override
  // TODO: implement props
  List<Object?> get props => [id, permalink, author, content];
}

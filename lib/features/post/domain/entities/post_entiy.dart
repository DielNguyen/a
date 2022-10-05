import 'package:equatable/equatable.dart';
class PostEntity extends Equatable{

  final int? id;
  final String title;
  final String body;

  PostEntity({this.id, required this.title, required this.body});

  @override
  List<Object> get props => [title, body];
}
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:equatable/equatable.dart';

abstract class AddDeleteUpdatePostsEvent extends Equatable {
  const AddDeleteUpdatePostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostsEvent {
  final PostEntity post;

  AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends AddDeleteUpdatePostsEvent {
  final PostEntity post;

  UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostsEvent {
  final int postId;
  DeletePostEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}

import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:equatable/equatable.dart';

abstract class PostsState extends Equatable{
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState{}

class LoadingPostsState extends PostsState{}

class LoadedPostsState extends PostsState{
  final List<PostEntity> posts;

  LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends PostsState{
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
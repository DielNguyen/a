import 'package:equatable/equatable.dart';

abstract class AddDeleteUpdatePostsState extends Equatable {
  const AddDeleteUpdatePostsState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostsState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostsState {}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostsState {
  final String message;

  const ErrorAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostsState {
  final String message;

  const MessageAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

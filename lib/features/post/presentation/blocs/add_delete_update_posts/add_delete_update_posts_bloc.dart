import 'package:a/core/error/failures.dart';
import 'package:a/core/strings/failures.dart';
import 'package:a/core/strings/messages.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/usecase/add_post.dart';
import 'package:a/features/post/domain/usecase/delete_post.dart';
import 'package:a/features/post/domain/usecase/get_add_posts.dart';
import 'package:a/features/post/domain/usecase/update_post.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_event.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_state.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_event.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostsEvent, AddDeleteUpdatePostsState> {
  final AddPostUsecase addPost;
  final DeletePostUsecase deletePost;
  final UpdatePostUsecase updatePost;

  AddDeleteUpdatePostBloc(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostsEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());

        final status = await addPost(event.post);

        emit(_eitherDoneMessageOrErrorState(status, ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());

        final status = await updatePost(event.post);
        
        emit(_eitherDoneMessageOrErrorState(status, UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());

        final status = await deletePost(event.postId);

         status.fold(
                (failure) {
                  emit(ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)));
                  return emit(AddDeleteUpdatePostInitial());

                },
                (_) {
                  return emit(MessageAddDeleteUpdatePostState(message: DELETE_SUCCESS_MESSAGE));

                });
      }
    });
  }

  AddDeleteUpdatePostsState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String mes) {
    return either.fold(
      (failure) =>
          ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddDeleteUpdatePostState(message: mes),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }
}

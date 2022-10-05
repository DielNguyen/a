import 'package:a/core/error/failures.dart';
import 'package:a/core/strings/failures.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/usecase/get_add_posts.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_event.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostEvent, PostsState> {
  final GetAllPostsUsecase getAllPosts;

  PostsBloc({required this.getAllPosts}): super(PostsInitial()){
    on<PostEvent>((event, emit) async {
      if(event is GetAllPostEvent){
        emit(LoadingPostsState());

        final posts = await getAllPosts();
        emit(_mapFailureOrPostsToState(posts));
      } else if(event is RefreshPostEvent){
        emit(LoadingPostsState());

        final posts = await getAllPosts();
        emit(_mapFailureOrPostsToState(posts));
      }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure, List<PostEntity>> either){
    return either.fold(
            (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
            (posts) => LoadedPostsState(posts: posts),
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }

}
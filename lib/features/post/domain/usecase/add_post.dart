import 'package:a/core/error/failures.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecase {
  final PostRepository repository;

  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await repository.addPost(postEntity);
  }
}
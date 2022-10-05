import 'package:a/core/error/failures.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
class UpdatePostUsecase {
  final PostRepository repository;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(PostEntity post) async {
    return await repository.updatePost(post);
  }
}
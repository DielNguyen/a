import 'package:a/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';

class DeletePostUsecase{
  final PostRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {

    return await repository.deletePost(postId);
  }
}
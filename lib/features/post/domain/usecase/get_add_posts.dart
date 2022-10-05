import 'package:a/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';

class GetAllPostsUsecase{
  final PostRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<PostEntity>>> call() async{
    return await repository.getAllPosts();
  }
}
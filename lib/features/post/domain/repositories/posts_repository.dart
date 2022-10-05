import 'package:a/core/error/failures.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository{
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(PostEntity postEntity);
  Future<Either<Failure, Unit>> addPost(PostEntity postEntity);
}
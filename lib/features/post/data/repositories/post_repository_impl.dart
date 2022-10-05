import 'package:a/core/error/exception.dart';
import 'package:a/core/error/failures.dart';
import 'package:a/core/network/network_info.dart';
import 'package:a/features/post/data/datasource/post_local_data_source.dart';
import 'package:a/features/post/data/datasource/post_remote_data_source.dart';
import 'package:a/features/post/data/models/post_models.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPost();

class PostRepositoryImpl implements PostRepository{
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({required this.networkInfo, required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if(await networkInfo.isConnected){
      try{
        final remotePost = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePost);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity postEntity) async {
    final PostModel postModel = PostModel(title: postEntity.title, body: postEntity.body);

    return await _getMessage(() {return remoteDataSource.addPost(postModel);});
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity postEntity) async {
    final PostModel postModel = PostModel(id: postEntity.id, title: postEntity.title, body: postEntity.body);

    return await _getMessage(() {return remoteDataSource.updatePost(postModel);});
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {

    return await _getMessage(() {return remoteDataSource.deletePost(id);});
  }

  Future<Either<Failure, Unit>> _getMessage(DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected){
      try{
        await deleteOrUpdateOrAddPost();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
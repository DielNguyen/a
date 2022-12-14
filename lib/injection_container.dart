import 'package:a/core/network/network_info.dart';
import 'package:a/features/post/data/datasource/post_local_data_source.dart';
import 'package:a/features/post/data/datasource/post_remote_data_source.dart';
import 'package:a/features/post/data/repositories/post_repository_impl.dart';
import 'package:a/features/post/domain/repositories/posts_repository.dart';
import 'package:a/features/post/domain/usecase/add_post.dart';
import 'package:a/features/post/domain/usecase/delete_post.dart';
import 'package:a/features/post/domain/usecase/get_add_posts.dart';
import 'package:a/features/post/domain/usecase/update_post.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - posts
  
  
  // Bloc
  
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(addPost: sl(), deletePost: sl(), updatePost: sl()));
  
  // Usecases

  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  
  // Repository
  
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl()
  ));
  
  // DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDatasourceIplm(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceIplm(sharedPreferences: sl()));

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
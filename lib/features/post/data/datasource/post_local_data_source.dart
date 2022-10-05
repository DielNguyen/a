import 'dart:convert';

import 'package:a/core/error/failures.dart';
import 'package:a/features/post/data/models/post_models.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

const CACHE_POSTS = 'CACHE_POSTS';

class PostLocalDataSourceIplm implements PostLocalDataSource{
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceIplm({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsJson = postModels.map<Map<String, dynamic>>((postModel) => postModel.toJson()).toList();
    sharedPreferences.setString(CACHE_POSTS, json.encode(postModelsJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHE_POSTS);
    if(jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModels = decodeJsonData.map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel)).toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheFailure();
    }
  }
  
}
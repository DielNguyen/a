import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/presentation/pages/post_add_update_page.dart';
import 'package:a/features/post/presentation/pages/post_detail_page.dart';
import 'package:flutter/material.dart';

class PostListWidget extends StatelessWidget {
  final List<PostEntity> posts;

  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(posts[index].title, style: const TextStyle(fontSize: 19)),
            subtitle: Text(
              posts[index].body,
              style: const TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () => _onUpdatePost(context, posts[index]),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: posts.length);
  }

  void _onUpdatePost(BuildContext context, PostEntity post){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PostDetailPage(post: post)));

  }
}

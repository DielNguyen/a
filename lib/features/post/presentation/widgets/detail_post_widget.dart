import 'package:a/core/styles/app_theme.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/post_add_update_page.dart';

class DetailPostWidget extends StatelessWidget {
  final bool isUpdatePost;
  final PostEntity post;

  const DetailPostWidget(
      {Key? key, required this.isUpdatePost, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          post.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            height: 1,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        ),
        Text(post.body,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            height: 1,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () => _deletePost(context),
              icon: const Icon(Icons.delete),
              label: Text('Delete'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton.icon(
              onPressed: () => _goToUpdatePost(context),
              icon: const Icon(Icons.edit),
              label: Text('Edit'),
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            )
          ],
        )
      ],
    );
  }

  void _deletePost(BuildContext context) {
    BlocProvider.of<AddDeleteUpdatePostBloc>(context)
        .add(DeletePostEvent(postId: post.id ?? -1));
  }

  void _goToUpdatePost(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PostAddUpdatePage(isUpdatePost: true, post: post)));
  }
}

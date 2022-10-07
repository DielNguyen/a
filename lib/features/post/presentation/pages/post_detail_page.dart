import 'dart:io';
import 'package:a/core/styles/app_theme.dart';
import 'package:a/core/utils/snackbar_message.dart';
import 'package:a/core/widgets/loading_widget.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_event.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_state.dart';
import 'package:a/features/post/presentation/pages/posts_page.dart';
import 'package:a/features/post/presentation/widgets/detail_post_widget.dart';
import 'package:a/features/post/presentation/widgets/message_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';

class PostDetailPage extends StatelessWidget {
  final PostEntity post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Post Detail'));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostsState>(
          listener: (context, state) {
            if(state is MessageAddDeleteUpdatePostState){
              SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostsPage()),
                      (route) => false
              );
            } else if (state is ErrorAddDeleteUpdatePostState){
              SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
            }
          },
          builder: (context, state) {
            if(state is LoadingAddDeleteUpdatePostState){
              return LoadingWidget();
            } else if (state is MessageAddDeleteUpdatePostState || state is AddDeleteUpdatePostInitial){
              return DetailPostWidget(isUpdatePost: true, post: post,);
            }
            return LoadingWidget();

          }),
    );
  }
}

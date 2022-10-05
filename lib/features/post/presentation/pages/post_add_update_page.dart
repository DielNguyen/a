import 'package:a/core/utils/snackbar_message.dart';
import 'package:a/core/widgets/loading_widget.dart';
import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_state.dart';
import 'package:a/features/post/presentation/pages/posts_page.dart';
import 'package:a/features/post/presentation/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAddUpdatePage extends StatelessWidget {
  final PostEntity? post;
  final bool isUpdatePost;

  const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text(isUpdatePost ? 'Edit Post' : 'Add Post'));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostsState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePostState) {
                SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostsPage()),
                  (route) => false
                );
              } else if (state is ErrorAddDeleteUpdatePostState) {
                SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePostState) {
                return LoadingWidget();
              }
              return FormWidget(
                isUpdatePost: isUpdatePost, post : isUpdatePost ? post : null
              );
        }),
      ),
    );
  }
}

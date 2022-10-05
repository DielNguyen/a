import 'package:a/core/widgets/loading_widget.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_event.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_state.dart';
import 'package:a/features/post/presentation/widgets/message_display_widget.dart';
import 'package:a/features/post/presentation/widgets/post_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_add_update_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(title: Text('title').tr());

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                child: PostListWidget(posts: state.posts),
                onRefresh: () => _onRefresh(context));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  _onRefresh(BuildContext context) {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const PostAddUpdatePage(isUpdatePost: false)));
        },
        child: const Icon(Icons.add));
  }
}

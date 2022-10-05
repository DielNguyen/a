import 'package:a/features/post/domain/entities/post_entiy.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'text_form_file_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final PostEntity? post;
  const FormWidget({Key? key, required this.isUpdatePost, this.post}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if(widget.isUpdatePost){
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddPost(){
    final isValid = _formKey.currentState!.validate();

    if(isValid){
      final post = PostEntity(
          id: widget.isUpdatePost ? widget.post!.id : null,
          title: _titleController.text,
          body: _bodyController.text);
      if(widget.isUpdatePost){
        BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(AddPostEvent(post: post));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFileWidget(name: 'Title', controller: _titleController, multipleLiene: false, ),
          TextFormFileWidget(name: 'Body', controller: _bodyController, multipleLiene: true, ),
          ElevatedButton.icon(
              onPressed: () => validateFormThenUpdateOrAddPost(),
              icon: widget.isUpdatePost? const Icon(Icons.edit) : const Icon(Icons.add),
              label: Text(widget.isUpdatePost ? 'Update' : 'Edit'),
          )
        ],
      ),  
    );
  }
}


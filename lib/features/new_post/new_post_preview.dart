import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'edit_new_post_cubit/edit_new_post_cubit.dart';

class NewPostPreview extends StatelessWidget {
  const NewPostPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNewPostCubit, EditNewPostState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 20),
            _title(state.newPost.title ?? ''),
            const SizedBox(height: 20),
            _abstractText(state.newPost.postAbstract ?? ''),
            _body(state.newPost.body ?? ''),
          ],
        );
      },
    );
  }

  Widget _title(String title) => Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      );

  Widget _abstractText(String abstractText) => Markdown(
        data: abstractText,
        shrinkWrap: true,
      );

  Widget _body(String body) => Markdown(
        data: body,
        shrinkWrap: true,
      );
}

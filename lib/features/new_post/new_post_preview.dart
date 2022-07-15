import 'package:bienestar_animal/features/new_post/cubit/create_new_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class NewPostPreview extends StatelessWidget {
  const NewPostPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewPostCubit, CreateNewPostState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 20),
            _title(state.postValues[PostValue.title] ?? ''),
            const SizedBox(height: 20),
            _abstractText(state.postValues[PostValue.abstractText] ?? ''),
            _body(state.postValues[PostValue.body] ?? ''),
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

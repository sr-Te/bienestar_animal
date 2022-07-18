import 'edit_new_post_cubit/edit_new_post_cubit.dart';
import 'new_post_edit.dart';
import 'new_post_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const TITLE = "Crear Nota";
const EDIT = "Editar";
const PREVIEW = "Previsualizar";

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNewPostCubit(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(TITLE),
            centerTitle: true,
            bottom: _tabBar(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark),
              ),
              IconButton(
                onPressed: () => _createPost(context),
                icon: const Icon(Icons.done),
              ),
            ],
          ),
          body: _tabBarView(),
        ),
      ),
    );
  }

  TabBar _tabBar() => const TabBar(
        physics: NeverScrollableScrollPhysics(),
        tabs: <Widget>[Tab(text: EDIT), Tab(text: PREVIEW)],
      );

  TabBarView _tabBarView() => const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [NewPostEdit(), NewPostPreview()],
      );

  void _createPost(BuildContext context) {}
}

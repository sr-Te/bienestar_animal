import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category.dart';
import '../../data/models/post.dart';
import '../../widgets/failure_view.dart';
import '../../widgets/loading_view.dart';
import 'posts_cubit/posts_cubit.dart';

class PostListPage extends StatelessWidget {
  final Category category;

  const PostListPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsInitial) {
            BlocProvider.of<PostsCubit>(context).getPosts(category);
            return const LoadingView();
          } else if (state is PostsLoadSuccess) {
            return _postList(state.posts);
          } else if (state is PostsLoadInProgress) {
            return const LoadingView();
          } else if (state is PostsLoadFailure) {
            return FailureView(message: state.message);
          } else {
            return const FailureView();
          }
        },
      ),
    );
  }

  Widget _postList(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) => Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[i].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(posts[i].postAbstract),
              ],
            ),
          ),
        ),
      );
}

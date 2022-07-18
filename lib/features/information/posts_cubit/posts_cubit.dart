import 'package:bienestar_animal/core/errors/failure.dart';
import 'package:bienestar_animal/data/repositories/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category.dart';
import '../../../data/models/post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepository postRepository;

  PostsCubit({required this.postRepository}) : super(PostsInitial());

  Future<void> getPosts(Category category) async {
    emit(PostsLoadInProgress());
    final failureOrPosts = await postRepository.getPosts(category);
    failureOrPosts.fold(
      (failure) => emit(PostsLoadFailure(mapFailureToMessage(failure))),
      (posts) => emit(PostsLoadSuccess(posts)),
    );
  }
}

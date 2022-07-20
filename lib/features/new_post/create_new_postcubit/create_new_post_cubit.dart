import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/post.dart';
import '../../../data/repositories/post_repository.dart';

part 'create_new_post_state.dart';

class CreateNewPostCubit extends Cubit<CreateNewPostState> {
  final PostRepository postRepository;

  CreateNewPostCubit({required this.postRepository})
      : super(CreateNewPostInitial());

  Future<void> createPost(NewPost newPost) async {}
}

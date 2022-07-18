import 'package:bienestar_animal/data/models/post.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_new_post_state.dart';

NewPost _newPost = NewPost();

class EditNewPostCubit extends Cubit<EditNewPostState> {
  EditNewPostCubit() : super(EditNewPostState(_newPost));

  Future<void> setValues(NewPost newPost) async {
    _newPost = newPost;
    emit(EditNewPostState(_newPost));
  }

  Future<void> resetValues() async {
    _newPost = NewPost();
    emit(EditNewPostState(_newPost));
  }
}

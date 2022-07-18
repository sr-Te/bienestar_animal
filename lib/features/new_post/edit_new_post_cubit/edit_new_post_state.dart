part of 'edit_new_post_cubit.dart';

class EditNewPostState extends Equatable {
  final NewPost newPost;
  const EditNewPostState(this.newPost);

  @override
  List<Object> get props => [newPost];
}

part of 'create_new_post_cubit.dart';

class CreateNewPostState extends Equatable {
  final Map<PostValue, String> postValues;
  const CreateNewPostState(this.postValues);

  @override
  List<Object> get props => [postValues];
}

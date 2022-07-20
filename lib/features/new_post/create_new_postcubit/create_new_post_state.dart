part of 'create_new_post_cubit.dart';

abstract class CreateNewPostState extends Equatable {
  const CreateNewPostState();

  @override
  List<Object> get props => [];
}

class CreateNewPostInitial extends CreateNewPostState {}

class CreateNewPostLoadInProgress extends CreateNewPostState {}

class CreateNewPostLoadSuccess extends CreateNewPostState {
  final Post post;
  const CreateNewPostLoadSuccess(this.post);

  @override
  List<Object> get props => [post];
}

class CreateNewPostLoadFailure extends CreateNewPostState {
  final String message;
  const CreateNewPostLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

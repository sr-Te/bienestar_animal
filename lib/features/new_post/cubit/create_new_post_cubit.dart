import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_new_post_state.dart';

enum PostValue {
  category,
  title,
  abstractText,
  body,
}

Map<PostValue, String> _postValues = {
  PostValue.category: '',
  PostValue.title: '',
  PostValue.abstractText: '',
  PostValue.body: '',
};

class CreateNewPostCubit extends Cubit<CreateNewPostState> {
  CreateNewPostCubit() : super(CreateNewPostState(_postValues));

  Future<void> setValues(Map<PostValue, String> postValues) async {
    _postValues = postValues;
    print(postValues);
    emit(CreateNewPostState(_postValues));
  }

  Future<void> resetValues() async {
    _postValues = {
      PostValue.category: '',
      PostValue.title: '',
      PostValue.abstractText: '',
      PostValue.body: '',
    };
    emit(CreateNewPostState(_postValues));
  }
}

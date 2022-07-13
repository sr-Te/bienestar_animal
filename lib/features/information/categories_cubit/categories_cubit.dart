import 'package:bienestar_animal/core/errors/failure.dart';
import 'package:bienestar_animal/data/repositories/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;

  CategoriesCubit({required this.categoryRepository})
      : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoadInProgress());
    final failureOrCategories = await categoryRepository.getCategories();
    failureOrCategories.fold(
      (failure) => emit(CategoriesLoadFailure(mapFailureToMessage(failure))),
      (categories) => emit(CategoriesLoadSuccess(categories)),
    );
  }
}

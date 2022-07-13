part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadInProgress extends CategoriesState {}

class CategoriesLoadSuccess extends CategoriesState {
  final List<Category> categories;
  const CategoriesLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesLoadFailure extends CategoriesState {
  final String message;
  const CategoriesLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

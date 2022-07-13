import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category.dart';
import '../../widgets/failure_view.dart';
import '../../widgets/loading_view.dart';
import 'categories_cubit/categories_cubit.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadSuccess) {
          return _categoriesOnSuccess(context, state.categories);
        } else if (state is CategoriesLoadInProgress) {
          return const LoadingView();
        } else if (state is CategoriesLoadFailure) {
          return FailureView(message: state.message);
        } else if (state is CategoriesInitial) {
          BlocProvider.of<CategoriesCubit>(context).getCategories();
          return const LoadingView();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _categoriesOnSuccess(BuildContext context, List<Category> categories) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: _goToCategory(context, categories[i]),
            child: Card(
              child: Stack(
                children: [
                  _categoryImage(categories[i]),
                  Container(color: const Color.fromARGB(145, 0, 0, 0)),
                  _categoryName(categories[i]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _goToCategory(BuildContext context, Category category) {}

  _categoryImage(Category category) => Center(
        child: CachedNetworkImage(
          imageUrl:
              "https://images.wagwalkingweb.com/media/training_guides/catch-food/hero/catch-food.jpg",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            )),
          ),
          placeholder: (context, url) => Container(color: Colors.black),
          errorWidget: (context, url, error) => Container(color: Colors.black),
        ),
      );

  _categoryName(Category category) => Center(
        child: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

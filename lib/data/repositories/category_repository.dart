import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../models/category.dart';

class CategoryRepository {
  final http.Client client;
  final NetworkInfo networkInfo;

  CategoryRepository({required this.client, required this.networkInfo});

  List<Category> categories = [];

  Future<Either<Failure, List<Category>>> getCategories() async =>
      categories.isEmpty ? await fetchCategories() : Right(categories);

  Future<Either<Failure, List<Category>>> fetchCategories() async {
    if (!await networkInfo.isConnected()) return Left(InternetFailure());

    return Right([
      Category(
        id: 1,
        name: "Ley chilena",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Category(
        id: 2,
        name: "mascotas",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Category(
        id: 3,
        name: "salud",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Category(
        id: 4,
        name: "alimentación",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Category(
        id: 5,
        name: "trucos",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Category(
        id: 6,
        name: "adiestramiento",
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
    ]);
  }
}

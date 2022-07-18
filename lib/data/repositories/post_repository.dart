import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../models/category.dart';
import '../models/post.dart';

class PostRepository {
  final http.Client client;
  final NetworkInfo networkInfo;

  PostRepository({required this.client, required this.networkInfo});

  Map<String, List<Post>> postsByCategory = {};

  Future<Either<Failure, List<Post>>> getPosts(Category category) async {
    final posts = postsByCategory[category.name];

    if (posts == null || posts.isEmpty) {
      return await fetchPosts(category);
    } else {
      return Right(posts);
    }
  }

  Future<Either<Failure, List<Post>>> fetchPosts(Category category) async {
    if (!await networkInfo.isConnected()) return Left(InternetFailure());

    return Right([
      Post(
        id: 1,
        title: "title1",
        postAbstract: "postAbstract1",
        body: "body1",
        photo: "photo1",
        category: category.name,
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Post(
        id: 2,
        title: "title1",
        postAbstract: "postAbstract1",
        body: "body1",
        photo: "photo1",
        category: category.name,
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Post(
        id: 3,
        title: "title1",
        postAbstract: "postAbstract1",
        body: "body1",
        photo: "photo1",
        category: category.name,
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Post(
        id: 4,
        title: "title1",
        postAbstract: "postAbstract1",
        body: "body1",
        photo: "photo1",
        category: category.name,
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
      Post(
        id: 5,
        title: "title1",
        postAbstract: "postAbstract1",
        body: "body1",
        photo: "photo1",
        category: category.name,
        createdAt: DateTime.now(),
        updatedAt: null,
        deletedAt: null,
      ),
    ]);
  }

  Future<Either<Failure, Post>> createPost(Post newPost) async {
    if (!await networkInfo.isConnected()) return Left(InternetFailure());

    if (postsByCategory[newPost.category] == null) {
      postsByCategory[newPost.category] = [];
    }
    postsByCategory[newPost.category]?.insert(0, newPost);

    return Right(newPost);
  }
}

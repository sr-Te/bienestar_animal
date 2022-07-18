// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../data/models/category.dart' as _i6;
import '../../features/home_page.dart' as _i1;
import '../../features/information/post_list_page.dart' as _i3;
import '../../features/new_post/new_post_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    NewPostRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NewPostPage());
    },
    PostListRoute.name: (routeData) {
      final args = routeData.argsAs<PostListRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.PostListPage(key: args.key, category: args.category));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(NewPostRoute.name, path: '/new-post-page'),
        _i4.RouteConfig(PostListRoute.name, path: '/post-list-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.NewPostPage]
class NewPostRoute extends _i4.PageRouteInfo<void> {
  const NewPostRoute() : super(NewPostRoute.name, path: '/new-post-page');

  static const String name = 'NewPostRoute';
}

/// generated route for
/// [_i3.PostListPage]
class PostListRoute extends _i4.PageRouteInfo<PostListRouteArgs> {
  PostListRoute({_i5.Key? key, required _i6.Category category})
      : super(PostListRoute.name,
            path: '/post-list-page',
            args: PostListRouteArgs(key: key, category: category));

  static const String name = 'PostListRoute';
}

class PostListRouteArgs {
  const PostListRouteArgs({this.key, required this.category});

  final _i5.Key? key;

  final _i6.Category category;

  @override
  String toString() {
    return 'PostListRouteArgs{key: $key, category: $category}';
  }
}

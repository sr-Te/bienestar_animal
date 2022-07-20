// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../data/models/category.dart' as _i7;
import '../../features/home_page.dart' as _i1;
import '../../features/information/post_list_page.dart' as _i3;
import '../../features/new_alert/new_alert_page.dart' as _i4;
import '../../features/new_post/new_post_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    NewPostRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NewPostPage());
    },
    PostListRoute.name: (routeData) {
      final args = routeData.argsAs<PostListRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.PostListPage(key: args.key, category: args.category));
    },
    NewAlertRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NewAlertPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(NewPostRoute.name, path: '/new-post-page'),
        _i5.RouteConfig(PostListRoute.name, path: '/post-list-page'),
        _i5.RouteConfig(NewAlertRoute.name, path: '/new-alert-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.NewPostPage]
class NewPostRoute extends _i5.PageRouteInfo<void> {
  const NewPostRoute() : super(NewPostRoute.name, path: '/new-post-page');

  static const String name = 'NewPostRoute';
}

/// generated route for
/// [_i3.PostListPage]
class PostListRoute extends _i5.PageRouteInfo<PostListRouteArgs> {
  PostListRoute({_i6.Key? key, required _i7.Category category})
      : super(PostListRoute.name,
            path: '/post-list-page',
            args: PostListRouteArgs(key: key, category: category));

  static const String name = 'PostListRoute';
}

class PostListRouteArgs {
  const PostListRouteArgs({this.key, required this.category});

  final _i6.Key? key;

  final _i7.Category category;

  @override
  String toString() {
    return 'PostListRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i4.NewAlertPage]
class NewAlertRoute extends _i5.PageRouteInfo<void> {
  const NewAlertRoute() : super(NewAlertRoute.name, path: '/new-alert-page');

  static const String name = 'NewAlertRoute';
}

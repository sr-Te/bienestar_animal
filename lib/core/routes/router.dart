import 'package:auto_route/auto_route.dart';
import 'package:bienestar_animal/features/information/post_list_page.dart';
import 'package:bienestar_animal/features/new_post/new_post_page.dart';

import '../../features/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: NewPostPage),
    AutoRoute(page: PostListPage),
  ],
)
class $AppRouter {}

import 'package:auto_route/auto_route.dart';

import '../../features/home_page.dart';
import '../../features/information/post_list_page.dart';
import '../../features/new_alert/new_alert_page.dart';
import '../../features/new_post/new_post_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: NewPostPage),
    AutoRoute(page: PostListPage),
    AutoRoute(page: NewAlertPage),
  ],
)
class $AppRouter {}

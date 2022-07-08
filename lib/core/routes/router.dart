import 'package:auto_route/auto_route.dart';

import '../../features/pages/info_page.dart';
import '../../features/pages/initial_page.dart';
import '../../features/pages/map_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitialPage, initial: true),
    AutoRoute(page: MapPage),
    AutoRoute(page: InfoPage),
  ],
)
class $AppRouter {}

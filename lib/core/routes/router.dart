import 'package:auto_route/auto_route.dart';

import '../../features/information/info_page.dart';
import '../../features/initial_page.dart';
import '../../features/map/map_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitialPage, initial: true),
    AutoRoute(page: MapPage),
    AutoRoute(page: InfoPage),
  ],
)
class $AppRouter {}

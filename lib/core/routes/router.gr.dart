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

import '../../features/information/info_page.dart' as _i3;
import '../../features/initial_page.dart' as _i1;
import '../../features/map/map_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    MapRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MapPage());
    },
    InfoRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.InfoPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(InitialRoute.name, path: '/'),
        _i4.RouteConfig(MapRoute.name, path: '/map-page'),
        _i4.RouteConfig(InfoRoute.name, path: '/info-page')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i4.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: '/');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.MapPage]
class MapRoute extends _i4.PageRouteInfo<void> {
  const MapRoute() : super(MapRoute.name, path: '/map-page');

  static const String name = 'MapRoute';
}

/// generated route for
/// [_i3.InfoPage]
class InfoRoute extends _i4.PageRouteInfo<void> {
  const InfoRoute() : super(InfoRoute.name, path: '/info-page');

  static const String name = 'InfoRoute';
}

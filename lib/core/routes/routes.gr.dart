// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../presentations/features/about_developer/pages/about_developer.dart'
    as _i5;
import '../../presentations/features/about_super_ai/pages/about_super_ai.dart'
    as _i4;
import '../../presentations/features/home_page/pages/home_page.dart' as _i2;
import '../../presentations/features/how_to_use/pages/how_to_use.dart' as _i6;
import '../../presentations/features/landing_page/pages/landing_page.dart'
    as _i1;
import '../../presentations/features/webview/pages/webview.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingPage(),
      );
    },
    HomePageRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    RadioWebviewRouter.name: (routeData) {
      final args = routeData.argsAs<RadioWebviewRouterArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i3.RadioWebview(
          key: args.key,
          radioUrl: args.radioUrl,
          tagline: args.tagline,
        ),
      );
    },
    AboutSuperAIRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AboutSuperAI(),
      );
    },
    AboutDeveloperRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AboutDeveloper(),
      );
    },
    HowToUseRouter.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HowToUse(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LandingRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomePageRouter.name,
          path: '/homePage',
        ),
        _i7.RouteConfig(
          RadioWebviewRouter.name,
          path: '/radioWebview',
        ),
        _i7.RouteConfig(
          AboutSuperAIRouter.name,
          path: '/aboutSuperAI',
        ),
        _i7.RouteConfig(
          AboutDeveloperRouter.name,
          path: '/aboutDeveloper',
        ),
        _i7.RouteConfig(
          HowToUseRouter.name,
          path: '/howToUse',
        ),
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i7.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRouter extends _i7.PageRouteInfo<void> {
  const HomePageRouter()
      : super(
          HomePageRouter.name,
          path: '/homePage',
        );

  static const String name = 'HomePageRouter';
}

/// generated route for
/// [_i3.RadioWebview]
class RadioWebviewRouter extends _i7.PageRouteInfo<RadioWebviewRouterArgs> {
  RadioWebviewRouter({
    _i8.Key? key,
    required String? radioUrl,
    required String? tagline,
  }) : super(
          RadioWebviewRouter.name,
          path: '/radioWebview',
          args: RadioWebviewRouterArgs(
            key: key,
            radioUrl: radioUrl,
            tagline: tagline,
          ),
        );

  static const String name = 'RadioWebviewRouter';
}

class RadioWebviewRouterArgs {
  const RadioWebviewRouterArgs({
    this.key,
    required this.radioUrl,
    required this.tagline,
  });

  final _i8.Key? key;

  final String? radioUrl;

  final String? tagline;

  @override
  String toString() {
    return 'RadioWebviewRouterArgs{key: $key, radioUrl: $radioUrl, tagline: $tagline}';
  }
}

/// generated route for
/// [_i4.AboutSuperAI]
class AboutSuperAIRouter extends _i7.PageRouteInfo<void> {
  const AboutSuperAIRouter()
      : super(
          AboutSuperAIRouter.name,
          path: '/aboutSuperAI',
        );

  static const String name = 'AboutSuperAIRouter';
}

/// generated route for
/// [_i5.AboutDeveloper]
class AboutDeveloperRouter extends _i7.PageRouteInfo<void> {
  const AboutDeveloperRouter()
      : super(
          AboutDeveloperRouter.name,
          path: '/aboutDeveloper',
        );

  static const String name = 'AboutDeveloperRouter';
}

/// generated route for
/// [_i6.HowToUse]
class HowToUseRouter extends _i7.PageRouteInfo<void> {
  const HowToUseRouter()
      : super(
          HowToUseRouter.name,
          path: '/howToUse',
        );

  static const String name = 'HowToUseRouter';
}

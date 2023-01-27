import 'package:ai_radio/presentations/features/about_developer/pages/about_developer.dart';
import 'package:ai_radio/presentations/features/about_super_ai/pages/about_super_ai.dart';
import 'package:ai_radio/presentations/features/home_page/pages/home_page.dart';
import 'package:ai_radio/presentations/features/how_to_use/pages/how_to_use.dart';
import 'package:ai_radio/presentations/features/landing_page/pages/landing_page.dart';
import 'package:ai_radio/presentations/features/webview/pages/webview.dart';
import 'package:auto_route/auto_route.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: LandingPage,
    ),
    AutoRoute(
      path: '/homePage',
      name: 'homePageRouter',
      page: HomePage,
    ),
    AutoRoute(
      path: '/radioWebview',
      name: 'radioWebviewRouter',
      page: RadioWebview,
    ),
    AutoRoute(
      path: '/aboutSuperAI',
      name: 'aboutSuperAIRouter',
      page: AboutSuperAI,
    ),
    AutoRoute(
      path: '/aboutDeveloper',
      name: 'aboutDeveloperRouter',
      page: AboutDeveloper,
    ),
    AutoRoute(
      path: '/howToUse',
      name: 'howToUseRouter',
      page: HowToUse,
    ),
  ],
)
class $AppRouter {}

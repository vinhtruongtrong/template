// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoutes.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    LoginRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoginPage(),
          opaque: true,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ForgotPasswordPage());
    },
    PostTabRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HeroEmptyRouterPage());
    },
    SettingsTabRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    PostRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PostPage());
    },
    CommentRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<CommentRouteArgs>(
          orElse: () => CommentRouteArgs(postId: queryParams.optInt('id')));
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: CommentPage(key: args.key, postId: args.postId));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        RouteConfig(EmptyRouterRoute.name, path: '/login', children: [
          RouteConfig(LoginRoute.name, path: '', parent: EmptyRouterRoute.name),
          RouteConfig(ForgotPasswordRoute.name,
              path: 'forgot-password', parent: EmptyRouterRoute.name)
        ]),
        RouteConfig(HomeRoutes.name, path: '/home', children: [
          RouteConfig(PostTabRoute.name,
              path: 'post',
              parent: HomeRoutes.name,
              children: [
                RouteConfig(PostRoute.name,
                    path: '', parent: PostTabRoute.name),
                RouteConfig(CommentRoute.name,
                    path: 'detail', parent: PostTabRoute.name)
              ]),
          RouteConfig(SettingsTabRoute.name,
              path: 'settings', parent: HomeRoutes.name)
        ])
      ];
}

/// generated route for [EmptyRouterPage]
class EmptyRouterRoute extends PageRouteInfo<void> {
  const EmptyRouterRoute({List<PageRouteInfo>? children})
      : super(name, path: '/login', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for [HomePage]
class HomeRoutes extends PageRouteInfo<void> {
  const HomeRoutes({List<PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoutes';
}

/// generated route for [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(name, path: 'forgot-password');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for [HeroEmptyRouterPage]
class PostTabRoute extends PageRouteInfo<void> {
  const PostTabRoute({List<PageRouteInfo>? children})
      : super(name, path: 'post', initialChildren: children);

  static const String name = 'PostTabRoute';
}

/// generated route for [SettingsPage]
class SettingsTabRoute extends PageRouteInfo<void> {
  const SettingsTabRoute() : super(name, path: 'settings');

  static const String name = 'SettingsTabRoute';
}

/// generated route for [PostPage]
class PostRoute extends PageRouteInfo<void> {
  const PostRoute() : super(name, path: '');

  static const String name = 'PostRoute';
}

/// generated route for [CommentPage]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute({Key? key, int? postId})
      : super(name,
            path: 'detail',
            args: CommentRouteArgs(key: key, postId: postId),
            rawQueryParams: {'id': postId});

  static const String name = 'CommentRoute';
}

class CommentRouteArgs {
  const CommentRouteArgs({this.key, this.postId});

  final Key? key;

  final int? postId;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, postId: $postId}';
  }
}

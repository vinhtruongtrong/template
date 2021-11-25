import 'package:authentication/presentation/login/login.dart';
import 'package:authentication/presentation/forgot_password/forgot_password.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/presentation/home/home.dart';
import 'package:post/presentation/comment/comment.dart';
import 'package:post/presentation/post/post.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/settings/settings.dart';

import 'hero_empty_router.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Dialog,Route',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/login',
      page: EmptyRouterPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
      children: [
        CustomRoute(
          path: '',
          page: LoginPage,
          initial: true,
        ),
        AutoRoute(
          path: 'forgot-password',
          page: ForgotPasswordPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
      name: 'HomeRoutes',
      children: [
        AutoRoute(
          path: 'post',
          page: HeroEmptyRouterPage,
          name: 'PostTabRoute',
          children: [
            AutoRoute(path: '', page: PostPage, initial: true),
            AutoRoute(
              path: 'detail',
              page: CommentPage,
            )
          ],
        ),
        AutoRoute(
          path: 'settings',
          page: SettingsPage,
          name: 'SettingsTabRoute',
        ),
      ],
    )
  ],
)
class AppRouter extends _$AppRouter {}

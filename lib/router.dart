import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:router_test/provider/login_state.dart';
import 'package:router_test/route_view/login_page.dart';
import 'package:router_test/route_view/screen_five.dart';
import 'package:router_test/route_view/screen_one.dart';
import 'package:router_test/route_view/screen_one_child.dart';
import 'package:router_test/route_view/screen_one_child2.dart';
import 'package:router_test/route_view/screen_one_child3.dart';
import 'package:router_test/route_view/screen_two.dart';
import 'package:router_test/route_view/screen_three.dart';
import 'package:router_test/route_view/screen_four.dart';
import 'package:router_test/store/store_child.dart';
import 'package:router_test/store/store_view.dart';
import 'package:router_test/transition.dart';

import 'error/custom_error.dart';
import 'main.dart';
import 'mind/mind_view.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  debugLogDiagnostics: true,
  observers: [
    GoRouterObserver()
  ],
  errorBuilder: (context, state) {
    /// 에러 타입별 페이지 분기 가능
    return CustomErrorView(error: state.error!, errorMsg: state.error!.message);
  },
  routes: [
    StatefulShellRoute.indexedStack(
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: shellNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder: (BuildContext context, GoRouterState state) => const ScreenOne(),
                  routes: [
                    GoRoute(
                      name: 'child',
                      path: 'child',
                      pageBuilder: defaultPageBuilder(const ScreenOneChild()),
                      routes: [
                        GoRoute(
                            name: 'child2',
                            path: 'child2',
                            builder: (context, state) => const ScreenOneChild2()

                        )
                      ],
                    ),
                    GoRoute(
                      name: 'animation',
                      path: 'animation',
                      pageBuilder: defaultPageBuilder(const TransitionPage()),

                    )
                  ]
              ),
            ]
          ),
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/store',
                  builder: (BuildContext context, GoRouterState state) => const StoreView(),
                    routes: [
                      GoRoute(
                        path: 'test',
                        builder: (context, state) {
                          return const StoreChildView();
                        }
                      )
                    ]
                ),
              ]
          ),
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/mind',
                  builder: (BuildContext context, GoRouterState state) => const MindCareView(),
                ),
              ]
          ),
        ],
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) =>
          MyHomePage(navigationShell: navigationShell),

    ),


    // ShellRoute(
    //   navigatorKey: shellNavKey,
    //   builder: (context, state, child) => MyHomePage(
    //     child: child,
    //   ),
    //   routes: [
    //       GoRoute(
    //         path: '/',
    //         pageBuilder: (context, state) => const NoTransitionPage(
    //           child: ScreenOne()
    //         ),
    //         routes: [
    //           GoRoute(
    //             name: 'child',
    //             path: 'child',
    //             pageBuilder: defaultPageBuilder(const ScreenOneChild()),
    //             routes: [
    //               GoRoute(
    //                   name: 'child2',
    //                   path: 'child2',
    //                   builder: (context, state) => const ScreenOneChild2()
    //
    //               )
    //             ],
    //           ),
    //           GoRoute(
    //             name: 'animation',
    //             path: 'animation',
    //             pageBuilder: defaultPageBuilder(const TransitionPage()),
    //
    //           )
    //         ]
    //       ),
    //       GoRoute(
    //         path: '/store',
    //         pageBuilder: (context, state) => const NoTransitionPage(
    //             child: StoreView()
    //         ),
    //         routes: [
    //           GoRoute(
    //             path: 'test',
    //             builder: (context, state) {
    //               return const StoreChildView();
    //             }
    //           )
    //         ]
    //       ),
    //       GoRoute(
    //         path: '/mind',
    //         pageBuilder: (context, state) => const NoTransitionPage(
    //             child: MindCareView()
    //         ),
    //       ),
    //     ],
    //   ),

    /// path parameters 넘기기
    GoRoute(
      name: 'two',
      path: '/two/:id',
      builder: (context, state) {
        return ScreenTwo(id: state.pathParameters['id']!);
      }
    ),

    /// redirect - login
    GoRoute(
      name: 'three',
      path: '/three',
      redirect: (context, state) {
        if(context.read<LoginProvider>().isLogin == false) {
          return '/login';
        } else {
          return null;
        }
      },
      builder: (context, state) {
        print('=====☂️☂️☂️☂️context: ${context.widget}');

        return const ScreenThree();
      }
    ),


    GoRoute(
      name: 'four',
      path: '/four',
      builder: (context, state) {
        print('🌿🌿🌿🌿context: $context, state: ${state.toString()}');
        return const ScreenFour();
      }
    ),

    /// arguments 넘기기
    GoRoute(
      name: 'five',
      path: '/five',
      builder: (context, state) {
        print('🌝🌝🌝🌝context: $context, state: ${state.toString()}');
        return ScreenFive(
          arguments: state.extra as ScreenFiveArguments,
        );
      }
    ),

    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      }
    ),
  ],
);


class GoRouterObserver extends NavigatorObserver {

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('push isCurrent: ${route.isCurrent}');
    print('push settings name : ${route.settings.name}');
    print('push settings arguments : ${route.settings.arguments}');
    print('push currentResult: ${route.currentResult}');
    print('push isActive: ${route.isActive}');
    print('push prev: $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('pop isCurrent: ${route.isCurrent}');
    print('pop currentResult: ${route.currentResult}');
    print('pop isActive: ${route.isActive}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('remove isCurrent: ${route.isCurrent}');
    print('remove currentResult: ${route.currentResult}');
    print('remove isActive: ${route.isActive}');
    print('remove didRemove prev: $previousRoute');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('MyTest didReplace: $newRoute');
    print('MyTest didReplace prev: $oldRoute');
  }
}


CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    barrierColor: Colors.white,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    }
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
    Widget child) =>
        (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };



class ScreenFiveArguments {

  const ScreenFiveArguments({
    required this.id,
    required this.name,
    required this.treatmentId,
  });

  final int id;
  final String name;
  final int treatmentId;
}


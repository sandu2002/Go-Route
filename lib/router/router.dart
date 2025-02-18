import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/pages/child_page.dart';
import 'package:gorouter/pages/home_page.dart';
import 'package:gorouter/pages/profile_page.dart';
import 'package:gorouter/pages/user_page.dart';

class RouterClass {
  final router = GoRouter(
    errorPageBuilder: (context, state) {
      return MaterialPage<dynamic>(
          child: Scaffold(
        body: Center(
          child: Text("This page is not found!"),
        ),
      ));
    },
    initialLocation: "/",
    routes: [
      // Home Page
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return const HomePage();
        },
      ),

      // Profile Page
      GoRoute(
        name: "profile",
        path: "/profile",
        builder: (context, state) {
          return const ProfilePage();
        },
        routes: [
          GoRoute(
            name: "child",
            path: "child",
            builder: (context, state) {
              return const ChildPage();
            },
          )
        ],
      ),
      //user page
      GoRoute(
        path: "/user",
        builder: (context, state) {
          final String name = state.extra as String;
          return UserPage(userName: name);
        },
      )
    ],
  );
}

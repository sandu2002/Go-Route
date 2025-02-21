import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gorouter/pages/age.dart';
import 'package:gorouter/pages/back.dart';
import 'package:gorouter/pages/child_page.dart';
import 'package:gorouter/pages/home_page.dart';
import 'package:gorouter/pages/login.dart';
import 'package:gorouter/pages/profile_page.dart';
import 'package:gorouter/pages/user_page.dart';
import 'package:gorouter/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    errorPageBuilder: (context, state) {
      return MaterialPage<dynamic>(
        child: Scaffold(
          body: Center(
            child: Text("This page is not found!"),
          ),
        ),
      );
    },

    //redirect to login page if user is not logged in
    // redirect: (context, state) {
    //   bool isUserLoggedIn = UserDate.isUserLoggedIn;
    //   if (isUserLoggedIn) {
    //     return "/";
    //   } else {
    //     return "/login";
    //   }
    // },

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
        name: RouteNamesClass.profile,
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

      //user page extra parameter

      GoRoute(
        path: "/user",
        builder: (context, state) {
          final name = (state.extra as Map<String, dynamic>)["name"] as String;

          return UserPage(
            userName: name,
          );
        },
      ),

      //user page path parameter

      GoRoute(
        path: "/user/:name",
        builder: (context, state) {
          return UserPage(
            userName: state.pathParameters["name"]!,
          );
        },
      ),

      //age page

      GoRoute(
        path: "/age",
        name: RouteNamesClass.age,
        builder: (context, state) {
          final int age = state.uri.queryParameters["age"] == null
              ? 0
              : int.parse(state.uri.queryParameters["age"]!);

          return AgePage(age: age);
        },
      ),

      //Login Page
      GoRoute(
        // name: "child",
        path: "/login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),

      //Back Page
      GoRoute(
        // name: "Back Page",
        path: "/back",
        builder: (context, state) {
          return const BackPage();
        },
      )
    ],
  );
}

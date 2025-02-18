import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/router/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Home Page",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNamesClass.profile);
            },
            child: Text("Go to profile"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: Text("Go to child page"),
          ),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go(
              //   "/user",
              //   extra: {
              //     "name": "Sandupama",
              //     "age": 22,
              //   });

              String names = "Sandupama";
              GoRouter.of(context).go("/user/$names");
            },
            child: Text("Go to user page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNamesClass.age,queryParameters: {
                "age": "24"
              });
            },
            child: Text("Go to age page"),
          ),

          //back page
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/back");
            },
            child: Text("Go to back page"),
          ),
        ],
      ),
    );
  }
}

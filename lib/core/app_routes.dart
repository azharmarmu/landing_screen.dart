import 'package:firebase_chat/presentation/ui/error/error_screen.dart';
import 'package:firebase_chat/presentation/ui/landing/landing_screen.dart';
import 'package:firebase_chat/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

Route<dynamic> generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    case AppRoutes.landing:
      return MaterialPageRoute(
        builder: (_) => LandingScreen(),
      );

    default:
      return _errorRoute(args, settings.name);
  }
}

MaterialPageRoute _errorRoute(dynamic args, String? name) {
  return MaterialPageRoute(
    builder: (_) => Center(
      child: Scaffold(
        appBar: AppBar(),
        body: ErrorPage(message: name),
      ),
    ),
  );
}

class AppRoutes {
  //Authentication
  static const String login = '/';
  static const String landing = '/landing';
}

class BouncyPageRoute extends PageRouteBuilder {
  final Widget child;

  BouncyPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secAnimation) => child,
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.elasticInOut,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secAnimation) => child,
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

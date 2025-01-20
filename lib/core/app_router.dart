import '../../export.dart';

/// don't use for navigate without context
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  /// use for navigate without context
  static final GoRouter routes = GoRouter(
      navigatorKey: navKey,
      initialLocation: Routes.animatedSplash,
      routes: [
        // GoRoute(
        //   name: Routes.animatedSplash,
        //   path: Routes.animatedSplash,
        //   builder: (context, state) => AnimatedSplash(
        //     home: sl<GetStorage>().hasData(kToken)
        //         ? Routes.settingsNav
        //         : Routes.landing,
        //     title: '',
        //     duration: Duration.hoursPerDay,
        //     type: AnimatedSplashType.StaticDuration,
        //   ),
        // ),
        // GoRoute(
        //   name: Routes.login,
        //   path: Routes.login,
        //   builder: (context, state) => const LoginPage(),
        // ),
        // GoRoute(
        //   name: Routes.signup,
        //   path: Routes.signup,
        //   builder: (context, state) => const SignUpPage(),
        // ),
        // GoRoute(
        //   name: Routes.updatePass,
        //   path: Routes.updatePass,
        //   builder: (context, state) => const UpdatePassPage(),
        // ),
      ]);
}

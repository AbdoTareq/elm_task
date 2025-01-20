import 'package:elm_task/features/auth/presentation/pages/login_page.dart';
import 'package:elm_task/features/auth/presentation/pages/verify_page.dart';

import '../../export.dart';

/// don't use for navigate without context
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  /// use for navigate without context
  static final GoRouter routes = GoRouter(
      navigatorKey: navKey,
      initialLocation:
          sl<GetStorage>().hasData(kVerify) ? Routes.incidents : Routes.login,
      routes: [
        GoRoute(
          name: Routes.login,
          path: Routes.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: Routes.verify,
          path: Routes.verify,
          builder: (context, state) => VerifyPage(email: state.extra as String),
        ),
        // GoRoute(
        //   name: Routes.updatePass,
        //   path: Routes.updatePass,
        //   builder: (context, state) => const UpdatePassPage(),
        // ),
      ]);
}

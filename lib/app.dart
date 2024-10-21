import 'package:jaspr/jaspr.dart';
import 'package:jaspr_app_write_site/components/header.dart';
import 'package:jaspr_app_write_site/constants/constants.dart';
import 'package:jaspr_app_write_site/pages/auth_views/initial_page.dart';
import 'package:jaspr_app_write_site/pages/auth_views/login_view.dart';
import 'package:jaspr_app_write_site/pages/auth_views/signup_view.dart';
import 'package:jaspr_app_write_site/pages/home.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';

@client
class App extends StatefulComponent {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(routes: [
      ShellRoute(
          builder: (context, state, child) {
            return div([
              Header(),
              child,
            ]);
          },
          routes: [
            Route(
              path: '/',
              builder: (context, state) => ProviderScope(
                child: InitialPage(),
              ),
            ),
            Route(
              path: '/home',
              builder: (context, state) => Home(),
            ),
            Route(
              path: '/login',
              builder: (context, state) => LoginView(),
            ),
            Route(
              path: '/sign-up',
              builder: (context, state) => SignupView(),
            ),
          ])
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('*,*::before,*::after').box(
      boxSizing: BoxSizing.borderBox,
    ),
    css('img')
        .box(display: Display.block, width: 100.percent, height: Theme.auto),
    css('li').list(
      style: ListStyle.none,
    ),
    css('a').text(
      decoration: TextDecoration.unset,
    ),
  ];
}

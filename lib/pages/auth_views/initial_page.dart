import 'package:jaspr/jaspr.dart';
import 'package:jaspr_app_write_site/components/loader.dart';
import 'package:jaspr_app_write_site/pages/auth_views/signup_view.dart';
import 'package:jaspr_router/jaspr_router.dart';

class InitialPage extends StatefulComponent {
  @override
  State<InitialPage> createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    authService.checkSessions().then((value) {
      if (value) {
        Router.of(context).replace('/home');
      } else {
        Router.of(context).replace('/login');
      }
    });
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Loader();
  }

  @css
  static final List<StyleRule> styles = [];
}

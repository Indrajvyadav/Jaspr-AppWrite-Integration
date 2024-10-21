import 'package:jaspr/jaspr.dart';

class Home extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h2(
        [
          text('Hello there Welcome to the Home Page'),
        ],
      ),
    ]);
  }

  @css
  static final List<StyleRule> styles = [];
}

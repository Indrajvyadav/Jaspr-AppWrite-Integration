import 'package:jaspr/jaspr.dart';

class ErrorPage extends StatelessComponent {
  final String error;

  const ErrorPage({required this.error});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h1([text("Error")]),
      p([text("An error occurred: $error")]),
    ]);
  }
}

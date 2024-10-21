// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_app_write_site/components/header.dart' as prefix0;
import 'package:jaspr_app_write_site/components/loader.dart' as prefix1;
import 'package:jaspr_app_write_site/components/snack_bar.dart' as prefix2;
import 'package:jaspr_app_write_site/components/text_field.dart' as prefix3;
import 'package:jaspr_app_write_site/pages/auth_views/initial_page.dart' as prefix4;
import 'package:jaspr_app_write_site/pages/auth_views/login_view.dart' as prefix5;
import 'package:jaspr_app_write_site/pages/home.dart' as prefix6;
import 'package:jaspr_app_write_site/app.dart' as prefix7;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {
    prefix7.App: ClientTarget<prefix7.App>('app'),
  },
  styles: () => [
    ...prefix0.Header.styles,
    ...prefix1.Loader.styles,
    ...prefix2.Snackbar.styles,
    ...prefix3.TextFieldComponent.styles,
    ...prefix4.InitialPageState.styles,
    ...prefix5.LoginViewState.styles,
    ...prefix6.Home.styles,
    ...prefix7.AppState.styles,
  ],
);

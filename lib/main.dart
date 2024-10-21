import 'package:jaspr/server.dart';
import 'package:jaspr_app_write_site/components/header.dart';
import 'package:jaspr_app_write_site/components/snack_bar.dart';
import 'package:jaspr_app_write_site/constants/constants.dart';
import 'package:jaspr_app_write_site/jaspr_options.dart';
import 'package:jaspr_app_write_site/pages/auth_views/initial_page.dart';
import 'package:jaspr_app_write_site/pages/auth_views/login_view.dart';
import 'package:jaspr_app_write_site/pages/home.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import 'app.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(
    Document(
      meta: {"description": "This site shows Appwrite Authentication"},
      title: 'Jaspr website',
      lang: 'en',
      head: [
        link(href: 'manifest.json', rel: 'manifest'),
        link(href: '/styles/style.css', rel: 'stylesheet')
      ],
      styles: [
        css('html, body').box(
            margin: Theme.eZero,
            padding: Theme.eZero,
            boxSizing: BoxSizing.borderBox),
        ...AppState.styles,

        //component styles
        ...Header.styles,
        ...Snackbar.styles,
        //auth-view styles
        ...LoginViewState.styles,
        ...InitialPageState.styles,
        //page styles
        ...Home.styles,
      ],
      body: ProviderScope(child: App()),
    ),
  );
}

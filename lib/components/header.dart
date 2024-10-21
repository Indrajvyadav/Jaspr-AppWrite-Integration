import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Header extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;
    yield header(classes: 'main-header', [
      div(classes: 'sub-header', [
        nav(classes: 'nav-container', [
          for (var route in [
            (label: 'home', path: '/home'),
          ])
            div(classes: activePath == route.path ? 'activeLink' : null, [
              Link(
                  to: route.path,
                  child: h6(
                    [text(route.label)],
                  ))
            ])
        ])
      ])
    ]);
    yield hr(classes: 'header-bottom-border');
  }

  @css
  static final List<StyleRule> styles = [
    css('.header-bottom-border').box(
      border: const Border.all(
        BorderSide(
          style: BorderStyle.solid,
          color: Colors.red,
        ),
      ),
    )
  ];
}

import 'package:jaspr/jaspr.dart';

class Snackbar extends StatelessComponent {
  final String message;
  final bool visible;

  const Snackbar({
    required this.message,
    this.visible = false,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      attributes: {
        'class': visible ? 'snackbar show' : 'snackbar',
      },
      [
        text(message.isNotEmpty ? message : ' '),
      ], // Avoid empty string issues
    );
  }

  @css
  static final List<StyleRule> styles = [
    css('.snackbar')
        .box(
          visibility: Visibility.hidden,
          radius: BorderRadius.all(Radius.circular(4.px)),
          padding: EdgeInsets.all(1.rem),
          position: const Position.relative(
            zIndex: ZIndex(1),
          ),
          opacity: 0,
        )
        .text(color: const Color.hex('#fff'), align: TextAlign.center)
        .background(
          color: const Color.hex('#333'),
        )
        .raw({
      'transition': 'visibility 0s,opacity 0.5s ease-in-out',
      'min-width': 'fit-content'
    }),
    //
    //
    css('.snackbar.show').box(
      visibility: Visibility.visible,
      opacity: 1,
    )
  ];
}

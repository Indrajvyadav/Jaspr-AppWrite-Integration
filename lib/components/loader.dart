import 'package:jaspr/jaspr.dart';

class Loader extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'loader',
      [],
    );
  }

  @css
  static final List<StyleRule> styles = [
    css('.loader')
        .box(
          radius: BorderRadius.all(
            Radius.circular(50.percent),
          ),
          width: 3.75.rem,
          height: 3.75.rem,
          border: Border.all(
            BorderSide(
              color: const Color.hex('#f3f3f3'),
              style: BorderStyle.solid,
              width: 1.rem,
            ),
          ),
          overflow: Overflow.hidden, // Ensure rounded corners are respected.
        )
        .box(
          border: Border.only(
            top: BorderSide(
              color: const Color.hex('#3498db'),
              style: BorderStyle.solid,
              width: 1.rem,
            ),
          ),
        )
        .raw({
      'animation': 'spin 2s linear infinite',
    }),

    // Define the keyframes animation.
    css.keyframes('spin', {
      '0%': Styles.box(transform: Transform.rotate(0.deg)),
      '100%': Styles.box(transform: Transform.rotate(360.deg)),
    }),
  ];
}

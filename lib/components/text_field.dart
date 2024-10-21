import 'package:jaspr/jaspr.dart';

class TextFieldComponent extends StatelessComponent {
  final String placeHolder;
  final ValueChanged<dynamic>? onInputs;
  final String autoComplete;
  final String name;
  final bool reqBool;
  final InputType inputType;

  const TextFieldComponent({
    super.key,
    required this.placeHolder,
    required this.name,
    required this.reqBool,
    required this.autoComplete,
    required this.onInputs,
    required this.inputType,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        input(
          classes: 'text-input',
          attributes: {
            'required': '$reqBool',
            'autocomplete': autoComplete,
            'placeholder': placeHolder,
          },
          name: name,
          type: inputType,
          onInput: onInputs,
          [],
        ),
      ],
    );
  }

  @css
  static final List<StyleRule> styles = [
    css('.text-input')
        .text(color: Colors.black)
        .box(
            padding: EdgeInsets.all(0.5.rem),
            height: 3.rem,
            width: 100.percent,
            radius: BorderRadius.all(
              Radius.circular(5.px),
            ),
            border: Border.all(BorderSide(
              color: Colors.black,
              width: 1.px,
              style: BorderStyle.solid,
            )))
        .background(),
    css(
      '.text-input::placeholder',
    ).text(
      color: Colors.black,
    )
  ];
}

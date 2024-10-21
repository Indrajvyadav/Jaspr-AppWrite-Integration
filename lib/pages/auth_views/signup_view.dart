// ignore_for_file: avoid_print

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_app_write_site/api/auth_resources/auth_service.dart';
import 'package:jaspr_app_write_site/components/text_field.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../../components/snack_bar.dart';

class SignupView extends StatefulComponent {
  @override
  State createState() => SignupViewState();
}

final AuthService authService = AuthService();

class SignupViewState extends State<SignupView> {
  String email = '';
  String password = '';
  String message = ' ';
  bool isVisible = false;

  void updateEmail(String input) {
    setState(() {
      print('Email: $email');
      email = input;
    });
  }

  void updatePassword(String input) {
    setState(() {
      print('Password: $password');
      password = input;
    });
  }

  Future onSignUp() async {
    isVisible = false;
    String res = await authService.signUp(email: email, password: password);
    if (res == "success") {
      print('User Signned up!');
      if (mounted) {
        setState(() {
          isVisible = true;
          message = 'Registered! please Login';
        });
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isVisible = false;
          });
        }).then(
          (value) => Router.of(context).push('/'),
        );
      }
    } else {
      print('Error');
      if (mounted) {
        setState(() {
          isVisible = true;
          message = res;
        });
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isVisible = false;
          });
        });
      }
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'main-back-comp',
      [
        div(classes: 'login-main-content', [
          form(classes: 'signup form', method: FormMethod.post, events: {
            'submit': (event) async {
              event.preventDefault();
              await onSignUp();
            }
          }, [
            TextFieldComponent(
                placeHolder: 'Email address',
                name: 'email',
                reqBool: true,
                autoComplete: 'email',
                inputType: InputType.email,
                onInputs: (value) {
                  updateEmail(
                    value.toString(),
                  );
                }),
            //
            TextFieldComponent(
                placeHolder: 'Password',
                name: 'password',
                reqBool: true,
                autoComplete: 'new-password',
                inputType: InputType.password,
                onInputs: (value) {
                  updatePassword(
                    value.toString(),
                  );
                }),

            button(classes: 'form-button', type: ButtonType.submit, [
              text('Done'),
            ])
          ]),
          div(classes: 'bottom-href', [
            h5(
              [text('Already have an account?')],
            ),
            a(href: '/', [
              text('Log in'),
            ]),
          ])
        ]),
        div(
            classes: 'snackbar-div-main',
            [Snackbar(message: message, visible: isVisible)])
      ],
    );
  }
}

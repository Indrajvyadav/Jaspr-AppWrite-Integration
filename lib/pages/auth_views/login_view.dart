// ignore_for_file: avoid_print

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_app_write_site/components/text_field.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../../api/auth_resources/auth_service.dart';
import '../../components/snack_bar.dart';

class LoginView extends StatefulComponent {
  @override
  State createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';
  String message = ' ';
  bool isVisible = false;

  final AuthService authService = AuthService();

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

  // onLogIn() async {
  //   final session = await authService.logIn(email: email, password: password);
  //   if (session.$id != '') {
  //     print('login success: ${session.$id}');
  //   }
  //   return session;
  // }

  // onLogin() async {
  //   final session = await authService.logIn(email: email, password: password);
  //   print('Logged in with session: ${session.userId}');

  //   // Check current user session after logging in
  //   final currentSession = await authService.currentUser();
  //   if (currentSession != null) {
  //     print('Current session user ID: ${currentSession.userId}');
  //   } else {
  //     print('Failed to retrieve current session.');
  //   }
  // }

  Future onLogIn() async {
    isVisible = false;
    String res = await authService.logIn(email: email, password: password);
    if (res == "success") {
      print('User Logged in!');
      if (mounted) {
        setState(() {
          isVisible = true;
          message = 'Login Successful';
        });
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isVisible = false;
          });
        }).then((value) => Router.of(context).replace('/home'));
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
              await onLogIn();
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
              [text('Dont have an account?')],
            ),
            a(href: '/sign-up', [
              text('Sign up'),
            ]),
          ])
        ]),
        div(classes: 'snackbar-div-main', [
          Snackbar(message: message, visible: isVisible),
        ])
      ],
    );
  }

  @css
  static final List<StyleRule> styles = [
    //
    css('.login-main-content').flexbox(
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      direction: FlexDirection.column,
    ),
    //
    css('.form')
        .flexbox(alignItems: AlignItems.center)
        .box(
            margin: EdgeInsets.only(top: 10.rem),
            width: 60.percent,
            display: Display.flex)
        .flexbox(
          direction: FlexDirection.column,
        )
        .raw({'row-gap': '1rem'}),
    css('.form-button')
        .box(
          transition: const Transition(
            'all',
            duration: 150,
          ),
          cursor: Cursor.pointer,
          width: 25.percent,
          height: 3.rem,
          radius: BorderRadius.all(
            Radius.circular(4.rem),
          ),
        )
        .flexItem(alignSelf: AlignSelf.center)
        .text(
          fontSize: 1.rem,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
    css('.form-button:hover')
        .background(
          color: Colors.black,
        )
        .text(color: Colors.white),

    //
    css('.bottom-href', [
      css('&'),
      css('h5').text(fontSize: 1.rem).box(
            padding: EdgeInsets.only(right: 3.5.px),
          ),
      css('a').flexItem(alignSelf: AlignSelf.center)
    ]).box(
      margin: EdgeInsets.only(top: 4.rem),
      display: Display.flex,
    ),

    //
    //
    css('.snackbar-div-main')
        .box(display: Display.flex, margin: EdgeInsets.only(top: 3.rem))
        .flexbox(
            direction: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center)
  ];
}

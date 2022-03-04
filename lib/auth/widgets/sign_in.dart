import 'package:custom_animations_playground/auth/widgets/decoration_functions.dart';
import 'package:custom_animations_playground/auth/widgets/sign_bar.dart';
import 'package:custom_animations_playground/utils/pallet.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key? key,
    required this.onSignUpClicked,
  }) : super(key: key);

  final void Function() onSignUpClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcom\nback',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Pallet.darkBlue,
                      ),
                      decoration: registerInputDecoration(
                          hintText: 'Email', isSignIn: true),
                      autocorrect: false,
                      // onChanged: (value) => context
                      //     .read<SignInHandlerStateNotifier>()
                      //     .emailChanged(EmailAddress(value)),
                      validator: (value) {
                        const emailRegex =
                            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

                        if (RegExp(emailRegex).hasMatch(value ?? '')) {
                          return null;
                        }
                        return 'invalid email';
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(
                          hintText: 'Password', isSignIn: true),
                      validator: (value) {
                        if (value?.isNotEmpty ?? false) {
                          return null;
                        }
                        return 'password required';
                      }),
                ),
                SignInBar(
                  label: 'Sign in',
                  isLoading: true,
                  onPressed: () {},
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      // print('cliked');
                      onSignUpClicked();
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Pallet.darkBlue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

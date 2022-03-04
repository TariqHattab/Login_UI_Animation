import 'package:custom_animations_playground/auth/widgets/decoration_functions.dart';
import 'package:custom_animations_playground/auth/widgets/sign_bar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.onSignInClicked,
  }) : super(key: key);
  final void Function() onSignInClicked;
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
                  'Create\nAccount',
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
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(
                          hintText: 'Email', isSignIn: false),
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
                          hintText: 'Password', isSignIn: false),
                      validator: (value) {
                        const emailRegex =
                            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

                        if (RegExp(emailRegex).hasMatch(value ?? '')) {
                          return null;
                        }
                        return 'invalid email';
                      }),
                ),
                SignUpBar(
                  label: 'Sign up',
                  isLoading: true,
                  onPressed: () {},
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    // highlightColor: Colors.white,
                    splashColor: Colors.white,
                    onTap: () {
                      onSignInClicked();
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
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

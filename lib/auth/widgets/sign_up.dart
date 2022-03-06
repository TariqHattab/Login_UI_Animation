import 'package:custom_animations_playground/auth/widgets/decoration_functions.dart';
import 'package:custom_animations_playground/auth/widgets/sign_bar.dart';
import 'package:custom_animations_playground/lang/lang.dart';
import 'package:custom_animations_playground/utils/funcs.dart';
import 'package:custom_animations_playground/utils/pallet.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

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
          Expanded(
            flex: 3,
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  tr(context).createAccount,
                  style: const TextStyle(
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
                          hintText: tr(context).email, isSignIn: false),
                      autocorrect: false,
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
                          hintText: tr(context).password, isSignIn: false),
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
                  label: tr(context).signUp,
                  isLoading: true,
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onSignInClicked();
                      },
                      child: Text(
                        tr(context).signIn,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        context.read<AppLang>().toggleLang();
                      },
                      child: Text(
                        tr(context).language,
                        style: const TextStyle(
                          color: Pallet.darkBlue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:custom_animations_playground/utils/pallet.dart';
import 'package:flutter/material.dart';

InputDecoration registerInputDecoration(
    {required String hintText, required bool isSignIn}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
    hintStyle: TextStyle(
        color: isSignIn ? Pallet.darkBlue : Colors.white, fontSize: 18),
    hintText: hintText,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: isSignIn ? Pallet.darkBlue : Colors.white, width: 2),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: isSignIn ? Pallet.darkBlue : Colors.white),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Pallet.orange),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Pallet.orange),
    ),
    errorStyle: TextStyle(color: isSignIn ? Pallet.darkBlue : Colors.white),
  );
}

InputDecoration signInInputDecoration({required String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
    hintStyle: const TextStyle(fontSize: 18),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Pallet.darkBlue),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Pallet.darkBlue),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Pallet.darkOrange),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Pallet.darkOrange),
    ),
    errorStyle: const TextStyle(color: Pallet.darkOrange),
  );
}

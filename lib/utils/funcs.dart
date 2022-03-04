import 'package:custom_animations_playground/lang/lang.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppLocalizations tr(BuildContext context) => AppLocalizations.of(context)!;
bool isArLang(BuildContext context) =>
    (context.watch<AppLang>().selectedLang == Locale("ar"));

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'widgets/signup_widgets.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpCommon(
        fromSignUp: false,
        title: AppLocalizations.of(context)!.login,
        textButton: ' ${AppLocalizations.of(context)!.create_an_account}',
        beforeButton: AppLocalizations.of(context)!.not_registered_yet);
  }
}

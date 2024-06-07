import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'widgets/signup_widgets.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpCommon(
        title: AppLocalizations.of(context)!.sign_up,
        textButton: ' ${AppLocalizations.of(context)!.login}',
        beforeButton: AppLocalizations.of(context)!.already_have_an_account);
  }
}

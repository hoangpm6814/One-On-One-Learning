import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? AppLocalizations.of(context).do_not_have_account
              : AppLocalizations.of(context).already_have_an_account,
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? AppLocalizations.of(context).sign_up
                : AppLocalizations.of(context).log_in,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

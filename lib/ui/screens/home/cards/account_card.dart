import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nubank_clone/core/app_state.dart';
import 'package:nubank_clone/core/constants.dart';
import 'package:nubank_clone/core/locale_keys.g.dart';
import 'package:nubank_clone/ui/screens/account/account_screen.dart';
import 'package:nubank_clone/ui/screens/home/components/main_card.dart';
import 'package:nubank_clone/ui/theme/colors.dart';
import 'package:nubank_clone/ui/theme/icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewValues = Provider.of<AppState>(context).viewValues;

    return MainCard(
      LocaleKeys.account.tr(),
      NuIcons.ic_money_coins,
      [
        Text(
          LocaleKeys.balance_available.tr(),
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(height: 13),
        if (viewValues)
          Container(
            color: kUnviewColor,
            height: 29,
            width: double.infinity,
          )
        else
          Text('R\$ $kBalance', style: Theme.of(context).textTheme.headline5),
      ],
      onTap: () => Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 400),
              child: AccountScreen())),
    );
  }
}

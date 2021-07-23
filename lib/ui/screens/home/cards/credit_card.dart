import 'package:flutter/material.dart';
import 'package:nubank_clone/core/app_state.dart';
import 'package:nubank_clone/core/constants.dart';
import 'package:nubank_clone/ui/screens/credit/credit_screen.dart';
import 'package:nubank_clone/ui/screens/home/components/main_card.dart';
import 'package:nubank_clone/ui/theme/colors.dart';
import 'package:nubank_clone/ui/theme/icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nubank_clone/core/locale_keys.g.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewValues = Provider.of<AppState>(context).viewValues;

    return MainCard(
      LocaleKeys.credit_card.tr(),
      NuIcons.ic_card_nu,
      [
        Text(
          'Fatura atual',
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(height: 13),
        if (viewValues)
          Container(
            color: kUnviewColor,
            height: 51,
            width: double.infinity,
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'R\$ $kInvoce',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kInvoiceColor),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: LocaleKeys.limit_available.tr(),
                  style: Theme.of(context).textTheme.bodyText2,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' R\$ $kLimit',
                      style: TextStyle(
                        color: kLimitColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
      onTap: () => Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 400),
              child: CreditScreen())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:nubank_clone/ui/screens/easyinvest/easyinvest_screen.dart';
import 'package:nubank_clone/ui/screens/home/components/main_card.dart';
import 'package:nubank_clone/ui/shared/filled_chip.dart';
import 'package:page_transition/page_transition.dart';

class InvestmentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainCard(
      'Investimentos',
      [
        Text(
          'A revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital.',
          style: Theme.of(context).textTheme.caption!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15),
        FilledButton('Conhecer'),
      ],
      icon: Mdi.signal,
      onTap: () => Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 400),
              child: EasyInvestScreen())),
    );
  }
}

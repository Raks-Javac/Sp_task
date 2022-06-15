import 'dart:developer';

import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/shared/reusables_ex.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class WalletBalanceSection extends StatelessWidget {
  final double balance;
  const WalletBalanceSection({
    Key? key,
    this.balance = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/pngs/Wallet banner.png"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wallet \nBalance",
                    style: mediumTextStyle(context).copyWith(
                        color: Colors.white,
                        fontSize: screenAwareSize(30, context)),
                  ),
                  UIHelper.verticalSpaceSmall,
                  nairaText(
                    precedingText: "₦",
                    amount: balance,
                    style: boldTextStyle(context).copyWith(
                        color: Colors.white,
                        fontSize: screenAwareSize(50, context)),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class WalletSection extends StatefulWidget {
  const WalletSection({Key? key}) : super(key: key);

  @override
  _WalletSectionState createState() => _WalletSectionState();
}

class _WalletSectionState extends State<WalletSection> {
  @override
  Widget build(BuildContext context) {
    //create a CardController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    List<double> _listOfBalances = [
      100000,
      20000,
      30000,
      4000,
      50000,
      100000,
      20000,
      30000,
      4000,
      50000,
      100000,
      20000,
      30000,
      4000,
      50000,
      100000,
      20000,
      30000,
      4000,
      50000,
      100000,
      20000,
      30000,
      4000,
      50000
    ];
    int counter = _listOfBalances.length;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            cardHeightBottomMul: 0.6,
            cardHeightTopMul: 0.25,
            //add the first 3 cards
            items: _listOfBalances.map((e) {
              return WalletBalanceSection(
                balance: e,
              );
            }).toList(),
            onCardSwiped: (dir, index, widget) {
              log(index.toString());
              log(counter.toString());
              //Add the next card
              if (counter <= _listOfBalances.length) {
                _cardController.addItem(
                  WalletBalanceSection(
                    balance: _listOfBalances[index],
                  ),
                );
                if (counter == _listOfBalances.length) {
                  index = 0;
                  _cardController.addItem(
                    WalletBalanceSection(
                      balance: _listOfBalances[index],
                    ),
                  );
                }
                counter++;
              }
            },
            enableSwipeUp: true,
            enableSwipeDown: false,
          ),
        ],
      ),
    );
  }
}

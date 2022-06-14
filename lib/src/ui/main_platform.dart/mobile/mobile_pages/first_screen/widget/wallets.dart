import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/shared/reusables_ex.dart';
import 'package:flutter/material.dart';

class WalletBalanceSection extends StatelessWidget {
  const WalletBalanceSection({
    Key? key,
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
              padding: EdgeInsets.only(top: 30.0, left: 30.0),
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
                    amount: 40000,
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

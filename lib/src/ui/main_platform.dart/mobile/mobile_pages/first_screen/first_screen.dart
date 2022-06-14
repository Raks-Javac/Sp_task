import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/view_model/view_model.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/widget/wallets.dart';
import 'package:estate_project/src/ui/shared/svg_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<FirstScreenViewModel>(
      vmBuilder: (context) => FirstScreenViewModel(context: context),
      builder: _buildScreen,
    );
  }

  final quickActionsList = QuickActions();

  Widget _buildScreen(BuildContext context, FirstScreenViewModel viewModel) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColors(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            "Services",
            style: mediumTextStyle(context),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: RenderSvg(
                svgPath: 'assets/images/svgs/setting-2.svg',
                svgWidth: 25,
                svgHeight: 25,
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenAwareSize(40, context),
            vertical: screenAwareSize(15, context),
          ),
          child: Column(
            children: [
              WalletBalanceSection(),
              UIHelper.verticalSpaceMedium,
              Row(
                children: quickActionsList.quickTIonList().map((e) {
                  return Expanded(
                    child: TileAction(
                      label: e.actionType!,
                      tileColor: e.actionColor!,
                      svgpath: e.svgIconPath!,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }
}

class TileAction extends StatelessWidget {
  final String svgpath;
  final String label;
  final Color tileColor;

  const TileAction(
      {Key? key,
      required this.tileColor,
      required this.label,
      required this.svgpath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: tileColor,
          radius: screenAwareSize(45, context),
          child: RenderSvg(
            svgPath: svgpath,
            color: Colors.white,
            svgWidth: screenAwareSize(40, context),
            svgHeight: screenAwareSize(40, context),
          ),
        ),
        UIHelper.verticalSpaceSmall,
        Text(
          label,
          style: mediumTextStyle(context)
              .copyWith(fontSize: screenAwareSize(21, context)),
        ),
      ],
    );
  }
}

class QuickActions {
  final String? svgIconPath;
  final String? actionType;
  final Color? actionColor;

  QuickActions({this.actionColor, this.actionType, this.svgIconPath});

  List<QuickActions> quickTIonList() {
    return <QuickActions>[
      QuickActions(
          svgIconPath: "assets/images/svgs/topUp.svg",
          actionType: "Top Up",
          actionColor: Colors.blue[400]),
      QuickActions(
        svgIconPath: "assets/images/svgs/withdraw.svg",
        actionType: "Withdraw",
        actionColor: Colors.orange,
      ),
      QuickActions(
          svgIconPath: "assets/images/svgs/receive.svg",
          actionType: "Receive",
          actionColor: Colors.green),
      QuickActions(
          svgIconPath: "assets/images/svgs/transactions.svg",
          actionType: "Transactions",
          actionColor: Colors.purple[800])
    ];
  }
}

import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/view_model/view_model.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/widget/wallets.dart';
import 'package:estate_project/src/ui/shared/svg_render.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<FirstScreenViewModel>(
      vmBuilder: (context) => FirstScreenViewModel(context: context),
      builder: _buildScreen,
    );
  }

  final quickActionsList = QuickActions();
  final quickService = QuickServices();

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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenAwareSize(40, context),
              vertical: screenAwareSize(15, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //wallet section
                SizedBox(
                    height: screenAwareSize(400, context),
                    width: double.infinity,
                    child: const WalletSection()),
                UIHelper.verticalSpaceMedium,

                //quick actions section
                QuickActionsWidget(quickActionsList: quickActionsList),
                UIHelper.verticalSpaceMedium,

                //quick services section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Services",
                      style: mediumTextStyle(context).copyWith(
                        fontSize: screenAwareSize(30, context),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Row(
                      children: quickService.quickTIonList().map((e) {
                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: screenAwareSize(10, context),
                                vertical: screenAwareSize(0, context)),
                            padding: EdgeInsets.symmetric(
                                horizontal: screenAwareSize(5, context),
                                vertical: screenAwareSize(30, context)),
                            child: Column(
                              children: [
                                RenderSvg(
                                  svgPath: e.svgIconPath!,
                                  color: appColor,
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  e.actionType.toString(),
                                  style: normalTextStyle(context).copyWith(
                                      fontSize: screenAwareSize(23, context)),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    //referral section
                    UIHelper.verticalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refer And Earn",
                          style: mediumTextStyle(context).copyWith(
                            fontSize: screenAwareSize(30, context),
                          ),
                        ),
                        UIHelper.verticalSpaceSmall,
                        Container(
                          height: screenAwareSize(240, context),
                          width: deviceWidth(context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/pngs/Wallet banner.png",
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Refer a ',
                                        style: boldTextStyle(context)
                                            .copyWith(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: ' Friend ',
                                        style: boldTextStyle(context)
                                            .copyWith(color: Colors.yellow),
                                      )
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  "Earn Extra Cash",
                                  style: boldTextStyle(context)
                                      .copyWith(color: Colors.white),
                                ),
                                UIHelper.verticalSpaceSmall,
                                RawMaterialButton(
                                  onPressed: () {},
                                  fillColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Get Started",
                                    style: normalTextStyle(context).copyWith(
                                      fontSize: screenAwareSize(20, context),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({
    Key? key,
    required this.quickActionsList,
  }) : super(key: key);

  final QuickActions quickActionsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: quickActionsList.quickTIonList().map((e) {
        return Expanded(
          child: TileAction(
            label: e.actionType!,
            tileColor: e.actionColor!,
            svgpath: e.svgIconPath!,
          ),
        );
      }).toList(),
    );
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

class QuickServices {
  final String? svgIconPath;
  final String? actionType;

  QuickServices({this.actionType, this.svgIconPath});

  List<QuickServices> quickTIonList() {
    return <QuickServices>[
      QuickServices(
        svgIconPath: "assets/images/svgs/airtime.svg",
        actionType: "Airtime",
      ),
      QuickServices(
        svgIconPath: "assets/images/svgs/paybill.svg",
        actionType: "Pay Bill",
      ),
      QuickServices(
        svgIconPath: "assets/images/svgs/SplitPay.svg",
        actionType: "Split Pay",
      ),
    ];
  }
}

import 'package:estate_project/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kindly Click on the services tab to view",
              style: normalTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}

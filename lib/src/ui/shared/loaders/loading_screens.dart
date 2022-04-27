import 'package:estate_project/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: screenAwareSize(40, context),
                height: screenAwareSize(40, context),
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  backgroundColor: AppColors.backgroundColors(),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.backgroundColors()),
                )),
          ),
        ],
      ),
    );
  }
}

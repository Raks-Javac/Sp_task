import 'package:flutter/material.dart';
import 'package:estate_project/src/core/utils/constants.dart';

class ThemeHandler {
  static ThemeData get lightMode {
    return ThemeData(
      primaryColor: ColorsTexStyleStore.kTriviaGreenColor,
      primaryColorLight: ColorsTexStyleStore.kTriviaLightYellow,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorsTexStyleStore.kTriviaLightYellow.withOpacity(0.3)),
    );
  }
}

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double smallfontSize = 11.0;
  static const double mediumfontSize = 14.0;
  static const double largefontSize = 24.0;
  static const double mediumPlusfontSize = 18.0;
  static const double smallIconsSize = 15.0;

  // ignore: constant_identifier_names
  static const double _VerticalSpaceSmall = 10.0;
  // ignore: constant_identifier_names
  static const double _VerticalSpaceMedium = 30.0;
  // ignore: constant_identifier_names
  static const double _VerticalSpaceMediumPlus = 48.0;
  // ignore: constant_identifier_names
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  // ignore: constant_identifier_names
  static const double _HorizontalSpaceSmall = 10.0;
  // ignore: constant_identifier_names
  static const double _HorizontalSpaceMedium = 20.0;
  // ignore: constant_identifier_names
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceMediumPlus =
      SizedBox(height: _VerticalSpaceMediumPlus);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
}

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 414);
  } else {
    return MediaQuery.of(context).size.height * (value / 1181);
  }
}

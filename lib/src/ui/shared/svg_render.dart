import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RenderSvg extends StatelessWidget {
  final String svgPath;
  final double? svgHeight;
  final Color? color;
  final double? svgWidth;
  const RenderSvg(
      {Key? key, this.svgHeight, required this.svgPath, this.svgWidth,this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: svgHeight ?? 20.0,
      color: color ?? Colors.black,
      width: svgWidth ?? 20.0,
      allowDrawingOutsideViewBox: true,
    );
  }
}

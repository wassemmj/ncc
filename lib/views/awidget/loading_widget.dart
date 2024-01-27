import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: const SingleChildScrollView(
        physics: RangeMaintainingScrollPhysics(),
        child: PlaceholderLines(
          count: 20,
          animate: true,
          lineHeight: 20,
          minOpacity: 0.001,
          maxOpacity: 0.04,
          color: Colors.black54,
        ),
      ),
    );
  }
}

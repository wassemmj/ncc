import 'package:flutter/material.dart';

class SettingsAdminWidget extends StatelessWidget {
  const SettingsAdminWidget({Key? key, required this.text, required this.function}) : super(key: key);

  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        height: height * 0.05,
        width: width,
        margin: EdgeInsets.all(height * 0.022),
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54, width: 0.4),
            )),
        child: SizedBox(
          width: width / 2.2,
          child: Text(
            text,
            style: const TextStyle(
                letterSpacing: 0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}

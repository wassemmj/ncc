import 'package:flutter/material.dart';
import 'package:ncc_app/core/color1.dart';

import '../../../core/style.dart';

class SwitchAuth extends StatefulWidget {
  const SwitchAuth({Key? key, required this.login, required this.f}) : super(key: key);

  final bool login;
  final Function() f;

  @override
  State<SwitchAuth> createState() => _SwitchAuthState();
}

class _SwitchAuthState extends State<SwitchAuth> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.login
              ? 'Don\'t have an account?'
              : 'Already have an account?',
          style: Style.textStyle14,
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
            onPressed: widget.f,
            child: Text(
              widget.login ? 'Sing up' : 'Sign in',
              style: TextStyle(fontSize: 16,color: Color1.primaryColor),
            ))
      ],
    );
  }
}

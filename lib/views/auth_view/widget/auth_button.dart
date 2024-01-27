import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/core/color1.dart';
import 'package:ncc_app/logic/auth_cubit/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.login, required this.onPressed})
      : super(key: key);

  final bool login;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state.status == AuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( login ? 'log in Successfully' : 'Register Successfully')));
        } else if(state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('try again with full details')));
        }
      },
      builder: (context, state) {
        if(state.status == AuthStatus.loading) {
          return Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              color: Color1.primaryColor,
            ),
          );
        }
        return Container(
          alignment: Alignment.topRight,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    login
                        ? 'Login'.toUpperCase()
                        : 'Sing up'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Icon(Icons.arrow_forward_outlined, size: 18)
                ],
              )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/core/notify_sevices.dart';
import 'package:ncc_app/core/style.dart';
import 'package:ncc_app/core/token.dart';
import 'package:ncc_app/logic/auth_cubit/auth_cubit.dart';
import 'package:ncc_app/views/admin/nav_admin_view/nav_admin_view.dart';
import 'package:ncc_app/views/auth_view/widget/angle_auth.dart';
import 'package:ncc_app/views/auth_view/widget/auth_button.dart';
import 'package:ncc_app/views/auth_view/widget/switch_auth.dart';
import 'package:ncc_app/views/nav_view/nav_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/color1.dart';
import '../../data/models/auth_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController(text: 'userTest2@gmail.com');
  var passwordController = TextEditingController(text: '0959860097');
  var passwordCoController = TextEditingController(text: '123456789');
  var usernameController = TextEditingController(text: 'wasm');

  GlobalKey formKey = GlobalKey();

  bool obscure = true, obscure1 = true;

  bool login = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AngleAuth(),
              SizedBox(height: login ? height * 0.1 : height * 0.01),
              Container(
                padding: EdgeInsets.all(height * 0.02),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        login ? 'Login' : 'Create Account',
                        style: Style.textStyle30,
                      ),
                      login ? SizedBox(height: height * 0.013) : Container(),
                      login
                          ? const Text(
                              'Please sign in to continue',
                              style: Style.textStyle14,
                            )
                          : Container(),
                      SizedBox(height: height * 0.04),
                      !login
                          ? TextFormField(
                              cursorColor: Color1.primaryColor,
                              decoration: InputDecoration(
                                labelText: 'User name',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color1.primaryColor)
                                ),
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22),
                                focusColor: Color1.primaryColor,
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                iconColor: Color1.primaryColor,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color1.primaryColor,
                                ),
                              ),
                              controller: usernameController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'User name is required';
                                }
                                return null;
                              },
                            )
                          : Container(),
                      !login ? SizedBox(height: height * 0.022) : Container(),
                      TextFormField(
                        cursorColor: Color1.primaryColor,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            floatingLabelStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color1.primaryColor)
                            ),
                            focusColor: Color1.primaryColor,
                            labelStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                            iconColor: Color1.primaryColor,
                            prefixIcon:  Icon(
                              Icons.email_outlined,
                              color: Color1.primaryColor,
                            )),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Email is required';
                          } else if (!val.isValidEmail()) {
                            return 'The Email is not Valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.022),
                      TextFormField(
                        cursorColor: Color1.primaryColor,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color1.primaryColor)
                          ),
                          floatingLabelStyle: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 22),
                          focusColor: Color1.primaryColor,
                          labelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          iconColor: Color1.primaryColor,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color1.primaryColor,
                            // color: Color1.black,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(obscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                          ),
                        ),
                        obscureText: obscure,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (val) {
                          // RegExp regex = RegExp(
                          //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (val == null || val.isEmpty) {
                            return 'Password is required';
                          } else if (val.length < 8) {
                            return 'Short Password';
                          }
                          return null;
                        },
                      ),
                      !login ? SizedBox(height: height * 0.022) : Container(),
                      !login
                          ? TextFormField(
                              cursorColor: Color1.primaryColor,
                              decoration: InputDecoration(
                                labelText: 'Password Confirmation',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color1.primaryColor)
                                ),
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22),
                                focusColor: Color1.primaryColor,
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                iconColor: Color1.primaryColor,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color1.primaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(obscure1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      obscure1 = !obscure1;
                                    });
                                  },
                                ),
                              ),
                              obscureText: obscure1,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordCoController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Password Confirmation is required';
                                } else if (val != passwordController.text) {
                                  return 'passwords don\'t match';
                                }
                                return null;
                              },
                            )
                          : Container(),
                      SizedBox(height: height * 0.03),
                      AuthButton(
                        login: login,
                        onPressed: onPressed,
                      ),
                      SwitchAuth(
                          login: login,
                          f: () {
                            passwordController.clear();
                            emailController.clear();
                            passwordCoController.clear();
                            usernameController.clear();
                            setState(() => login = !login);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    if (login) {
      await BlocProvider.of<AuthCubit>(context).login(
        AuthModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (BlocProvider.of<AuthCubit>(context).state.status ==
          AuthStatus.success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int? status = prefs.getInt('role') ;
        if(status == 0) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const NavView(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const NavAdminView(),
          ));
        }
      }
    } else {
      await BlocProvider.of<AuthCubit>(context).register(
        AuthModel(
            name: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
            coPassword: passwordCoController.text),
      );
      if (BlocProvider.of<AuthCubit>(context).state.status ==
          AuthStatus.success) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const NavView(),
        ));
      }
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

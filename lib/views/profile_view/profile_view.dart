import 'package:flutter/material.dart';
import 'package:ncc_app/views/profile_view/widget/profile_nav.dart';

class Profile_View extends StatelessWidget {
  const Profile_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Profile_Nav(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/adverts_admin/adverts_admin.dart';
import 'package:ncc_app/views/admin/change_color_view/change_color_view.dart';
import 'package:ncc_app/views/admin/company_info_view/company_info_view.dart';
import 'package:ncc_app/views/admin/create_category/create_category.dart';
import 'package:ncc_app/views/admin/create_product/create_product.dart';
import 'package:ncc_app/views/admin/create_section/create_section.dart';
import 'package:ncc_app/views/admin/create_sector/create_sector.dart';
import 'package:ncc_app/views/admin/pcs_view/pcs_view.dart';
import 'package:ncc_app/views/admin/settings_admin/widget/settings_admin_widget.dart';
import 'package:ncc_app/views/admin/user_view/user_view.dart';

import '../../../logic/auth_cubit/auth_cubit.dart';
import '../../auth_view/login_view.dart';
import '../show_discount_view/show_discount_view.dart';

class SettingsAdmin extends StatefulWidget {
  const SettingsAdmin({Key? key}) : super(key: key);

  @override
  State<SettingsAdmin> createState() => _SettingsAdminState();
}

class _SettingsAdminState extends State<SettingsAdmin> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: Column(
          children: [
            SettingsAdminWidget(
                text: 'Process on PCS',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PCSView(),
                    ))),
            SettingsAdminWidget(
                text: 'All User',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserView(),
                ))),
            SettingsAdminWidget(
                text: 'Create Category',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateCategory(),
                    ))),
            SettingsAdminWidget(
                text: 'Create Section',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateSection(),
                    ))),
            SettingsAdminWidget(
                text: 'Create Sector',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreateSector(),
                ))),
            SettingsAdminWidget(
                text: 'Create Product',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateProduct(),
                    ))),
            SettingsAdminWidget(
                text: 'Adverts',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdvertsAdmin(),
                    ))),
            SettingsAdminWidget(
                text: 'Show Discount',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ShowDiscountView(),
                ))),
            SettingsAdminWidget(
                text: 'Contact Us',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CompanyInfoView(),
                ))),
            SettingsAdminWidget(
                text: 'Change Color',
                function: () => showDialog(context: context, builder: (context) => const ChangeColorView(),)),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('log out Successfully')));
                }
              },
              builder: (context, state) => SettingsAdminWidget(
                  text: 'Log out',
                  function: () async {
                    await BlocProvider.of<AuthCubit>(context).logout();
                    if (state.status == AuthStatus.success) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

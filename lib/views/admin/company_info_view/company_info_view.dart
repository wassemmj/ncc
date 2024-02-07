import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/logic/footer_cubit/footer_cubit.dart';
import 'package:ncc_app/views/admin/company_info_view/widget/footer_text.dart';
import 'package:ncc_app/views/admin/create_company_info_view/create_company_info_view.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/color1.dart';
import '../../nav_view/widget/appbar_icon.dart';

class CompanyInfoView extends StatefulWidget {
  const CompanyInfoView({Key? key}) : super(key: key);

  @override
  State<CompanyInfoView> createState() => _CompanyInfoViewState();
}

class _CompanyInfoViewState extends State<CompanyInfoView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<FooterCubit>(context, listen: false).getFooter();
    });
    super.initState();
  }

  int idd = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all((height / 108)),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black54.withOpacity(0.03),
          ),
        ),
        actions: [
          AppbarIcon(
            icon: Icons.add,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateCompanyInfoView(),
              ));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 82)),
          BlocListener<FooterCubit, FooterState>(
            listener: (context, state) {},
            child: AppbarIcon(
              icon: Icons.delete,
              onPressed: () async {
                var v = BlocProvider.of<FooterCubit>(context);
                await v.deleteFooter(idd);
                v.getFooter();
              },
              color: Colors.black54.withOpacity(0.03),
            ),
          ),
          SizedBox(width: (width / 82)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(height * 0.02),
            child: BlocBuilder<FooterCubit, FooterState>(
              builder: (context, state) {
                if (state.status == FooterStatus.loading ||
                    state.status == FooterStatus.initial) {
                  return const LoadingWidget();
                }
                if (BlocProvider.of<FooterCubit>(context).footer == null) {
                  return const LoadingWidget();
                }
                var footer =
                    BlocProvider.of<FooterCubit>(context).footer['message'];
                if (footer != "Footer information is empty") {
                  idd = footer[0]['id'];
                }
                if (footer != "Footer information is empty") {
                  return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 100,
                            child: Image.asset('image/logo.jpg'),
                          ),
                          SizedBox(height: height * 0.04),
                          const Text(
                            'Napoli Trading Company',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color1.black,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            footer[0]['description'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            footer[0]['address'],
                            maxLines: 2,
                            style: const TextStyle(
                              color: Color1.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          FooterText(
                              text1: Icons.email_outlined,
                              text2: footer[0]['email'], email: true,),
                          FooterText(
                              text1: Icons.phone,
                              text2: footer[0]['numberOne'].toString(), email: false,),
                          FooterText(
                              text1: Icons.phone,
                              text2: footer[0]['numberTwo'].toString(), email: false,),
                          footer[0]['numberTwo'] == null ?  FooterText(
                              text1: Icons.phone,
                              text2: footer[0]['numberThree'].toString(), email: false,) : Container(),
                          SizedBox(height: height * 0.02),
                          const Divider(
                            color: Colors.black54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    whatsapp(footer[0]['numberOne']);
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _launchURLBrowser(Uri.parse(
                                        footer[0]['faceBook_Account']));
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _launchURLBrowser(Uri.parse(
                                        footer[0]['instagram_Account']));
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Color.fromRGBO(64, 93, 230, 1),
                                  )),
                            ],
                          ),
                        ],
                      );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => EditCompanyDetails(
          //     description: footer[0]['description'],
          //     location: footer[0]['address'],
          //     email: footer[0]['email'],
          //     numberOne: footer[0]['numberOne'].toString(),
          //     numberTwo: footer[0]['numberTwo'].toString(),
          //     numberThree: footer[0]['numberThree'].toString(),
          //     facebook: footer[0]['faceBook_Account'],
          //     instagram: footer[0]['instagram_Account'],
          //     twitter: footer[0]['twitter_Account'], id: idd,
          //   ),
          // ));
        },
        backgroundColor: Color1.primaryColor,
        child: const Icon(Icons.edit),
      ),
    );
  }

  whatsapp(phone) async {
    var contact = '$phone';
    var androidUrl = "whatsapp://send?phone=$contact";
    var iosUrl = "https://wa.me/$contact";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      throw Exception('WhatsApp is not installed.');
    }
  }

  _launchURLBrowser(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:ncc_app/core/color1.dart';

import '../nav_view/widget/appbar_icon.dart';

class TableView extends StatelessWidget {
  const TableView({Key? key, required this.table}) : super(key: key);

  final Map table;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    table.remove('product_id');
    table.remove('id');
    table.remove('created_at');
    table.remove('updated_at');
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(height * 0.008),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black54.withOpacity(0.03),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          child: SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              children: [
                Text('Specifications',
                    style: TextStyle(
                        color: Color1.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: height * 0.02,),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth:
                      FixedColumnWidth(width / 2 - width * 0.04),
                  border: TableBorder.all(color: Colors.black54, width: 1),
                  children: table.entries
                      .map((e) => TableRow(children: [
                            Column(children: [
                              Text(
                                e.key,
                                style: const TextStyle(
                                    color: Color1.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                            Column(children: [
                              Text(
                                e.value ?? '_',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                          ]))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/admin/awidget/location_alert.dart';
import 'package:ncc_app/views/admin/awidget/order_admin_alert.dart';
import 'package:ncc_app/views/admin/order_admin_view/widget/order_admin_widget.dart';

import 'expandable_container.dart';

class ExpandableListView extends StatefulWidget {
  final String title;
  final Map order;

  const ExpandableListView(
      {super.key, required this.title, required this.order});

  @override
  State<ExpandableListView> createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  String? value = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    widget.order['status'] == 'accepted' ? IconButton(
                      icon: Icon(
                        widget.order['location'] == 'In Stock'
                            ? FontAwesomeIcons.truckFast
                            : widget.order['location'] != 'Arrived'
                                ? FontAwesomeIcons.truckArrowRight
                                : FontAwesomeIcons.truckFront,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: widget.order['location'] != 'Arrived' ?  () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            value = widget.order['location'];
                            return LocationAlert(id: widget.order['id'], valueOld: value);
                          },
                        );
                      } : () {},
                    ) : Container(),
                    widget.order['status'] != 'accepted' ? IconButton(
                      icon: Icon(
                        widget.order['status'] == 'pending'
                            ? Icons.access_time
                            : FontAwesomeIcons.x,
                        color: widget.order['status'] == 'pending'
                            ? Colors.black
                            : Colors.red,
                        size: 25,
                      ),
                      onPressed: widget.order['status'] == 'pending' ?  () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return OrderAdminAlert(id: widget.order['id'],);
                          },
                        );
                      } : () {},
                    ) : Container(),
                    IconButton(
                        icon: Icon(
                          expandFlag
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onPressed: () {
                          setState(() {
                            expandFlag = !expandFlag;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          ExpandableContainer(
            expanded: expandFlag,
            expandedHeight: (height * 0.22) * widget.order['products'].length,
            order: widget.order,
            child: SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderAdminWidget(
                    product: widget.order['products'][index],
                  );
                },
                itemCount: widget.order['products'].length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

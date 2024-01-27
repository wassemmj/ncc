import 'package:flutter/material.dart';

import '../../../core/api.dart';
import '../../../core/style.dart';
import '../../sector_view/sector_view.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.id, required this.name, required this.image}) : super(key: key);

  final int id;
  final String name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SectorView(secId: id, sectionName: name,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.04),
          borderRadius: BorderRadius.circular(15),
        ),
        child: image != null
            ? Column(
          children: [
            SizedBox(
              height: height * .14,
              child: Image.network(
                '${Api.apiImage}/section/${image}',
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Style.textStyle17,
            )
          ],
        )
            : Container(
          alignment: Alignment.center,
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Style.textStyle17,
          ),
        ),
      ),
    );
  }
}

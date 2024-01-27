import 'package:flutter/material.dart';

import '../../../core/style.dart';
import '../../products_view/products_view.dart';

class SectorWidget extends StatelessWidget {
  const SectorWidget({Key? key, required this.sectors}) : super(key: key);

  final List sectors;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(height * 0.03),
      height: height,
      child: GridView.builder(
        itemCount: sectors.length,
        physics: const RangeMaintainingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: height * 0.02,
          mainAxisSpacing: height * 0.02,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductsView(
                  name: sectors[index]['name'], sectorId: sectors[index]['id'],),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.04),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  sectors[index]['name'],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Style.textStyle17,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

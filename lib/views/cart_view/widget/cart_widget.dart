import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';

import '../../../core/api.dart';
import '../../../core/color1.dart';
import '../../../core/style.dart';
import 'increment_cart.dart';

class CartWidget extends StatelessWidget {
  const CartWidget(
      {Key? key,
      required this.name,
      required this.id,
      required this.brand,
      required this.price,
      required this.image,
      required this.quantity, required this.productId})
      : super(key: key);

  final String name;
  final int id;
  final int productId;
  final String brand;
  final String price;
  final String image;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        key: const ValueKey(0),
        children: [
          BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if(state.status == CartStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('deleted successfully')));
              }
            },
            child: SlidableAction(
              key: const ValueKey(0),
              onPressed: (context) async {
                await BlocProvider.of<CartCubit>(context).deleteItem(id);
              },
              backgroundColor: Color1.white,
              foregroundColor: const Color(0xFFFE4A49),
              icon: Icons.delete,
            ),
          ),
        ],
      ),
      child: Container(
        height: height * 0.13,
        margin: EdgeInsets.all(height * 0.022),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.black54, width: 0.2),
        )),
        child: Row(
          children: [
            Container(
              width: width * 0.3,
              height: height * 0.11,
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${Api.apiImage}/images/$image',
                      ),
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width - width * 0.42,
                  child: Text(
                    name,
                    style: const TextStyle(
                        letterSpacing: 0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                    maxLines: 3,
                  ),
                ),
                Text(
                  brand,
                  style: Style.textStyle14,
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Text(
                      '$price JOD',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    SizedBox(width: (width * 0.1)),
                    IncrementCart(quantity: int.parse(quantity), id: id, productId: productId,)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

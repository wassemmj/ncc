import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';

import '../../../core/color1.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({Key? key, required this.productId, required this.quantity}) : super(key: key);

  final int productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if(state.status == CartStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added Successfully')));
        } else if (state.status == CartStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product quantity exceeds the available limit')));
        }
      },
      child: InkWell(
          onTap: () async {
            await BlocProvider.of<CartCubit>(context).addToCart(productId, quantity);
          },
          child: Container(
            padding: EdgeInsets.only(
                left: width * 0.2, right: width * 0.21, top: height* 0.012, bottom: height* 0.012),
            decoration: BoxDecoration(
              color: Color1.primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Color1.white,
              ),
            ),
          ),
        ),
    );
  }
}

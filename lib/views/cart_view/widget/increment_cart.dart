import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';

class IncrementCart extends StatefulWidget {
  const IncrementCart(
      {Key? key,
      required this.quantity,
      required this.id,
      required this.productId})
      : super(key: key);

  final int quantity;
  final int id;
  final int productId;

  @override
  State<IncrementCart> createState() => _IncrementCartState();
}

class _IncrementCartState extends State<IncrementCart> {
  double height = 0, width = 0;

  late int _currentCount;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.quantity;
    BlocProvider.of<CartCubit>(context).qu = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          height: height * 0.025,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black12.withOpacity(0.04),
          ),
          child: Row(
            children: [
              _createIncrementDicrementButton(Icons.remove, () async {
                var w = BlocProvider.of<CartCubit>(context);
                if (_currentCount != 1) {
                  await w.deleteOneItem(widget.id);
                }
                await w.showCart();
              }, Colors.white, Colors.black),
              SizedBox(
                width: width * 0.009,
              ),
              Text(
                _currentCount.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: width * 0.009,
              ),
              _createIncrementDicrementButton(Icons.add, () async {
                var w = BlocProvider.of<CartCubit>(context);
                await w.addToCart(widget.productId, 1);
                await w.showCart();
              }, Colors.black, Colors.white),
            ],
          ),
        );
      },
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
      }
    });
  }

  Widget _createIncrementDicrementButton(
      IconData icon, Function() onPressed, Color fillColor, Color iconColor) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints:
          BoxConstraints(minWidth: width * 0.07, minHeight: height * 0.07),
      onPressed: onPressed,
      elevation: 0,
      fillColor: fillColor,
      shape: const CircleBorder(side: BorderSide(color: Colors.black)),
      child: Icon(
        icon,
        color: iconColor,
        size: (height * .02),
      ),
    );
  }
}

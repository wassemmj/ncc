import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/core/color1.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';
import 'package:ncc_app/views/cart_view/widget/cart_button.dart';
import 'package:ncc_app/views/cart_view/widget/cart_widget.dart';
import 'package:ncc_app/views/cart_view/widget/price_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
CircleAvatar(
  radius: 30,
  backgroundColor: Colors.greenAccent, //<-- SEE HERE
  child: IconButton(
    icon: Icon(
      Icons.flight,
      color: Colors.black,
    ),
    onPressed: () {},
  ),
)
 */

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double height = 0, width = 0;

  double total = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CartCubit>(context, listen: false).showCart();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.initial ||
              state.status == CartStatus.loading) {
            return Container(
              alignment: Alignment.center,
              height: height,
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ),
            );
          }
          if (BlocProvider.of<CartCubit>(context).cart == null) {
            return Container(
              alignment: Alignment.center,
              height: height,
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ),
            );
          }
          var cart = BlocProvider.of<CartCubit>(context).cart['cartItem'];
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: cart.isNotEmpty
                ? [
                    const SliverToBoxAdapter(
                      child: Divider(
                        color: Colors.black26,
                        thickness: 0.2,
                        height: 1,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          var price = double.parse(cart[index]['Unit_Price_Without_Discount']);
                          // total = total + (price * cart[index]['Quntity']);
                          return CartWidget(
                            name: cart[index]['name'],
                            id: cart[index]['id'],
                            brand: cart[index]['Brand'],
                            price: cart[index]['Unit_Price_Without_Discount'],
                            image: cart[index]['image'], quantity: cart[index]['Quntity'], productId: cart[index]['product_id'],
                          );
                        },
                      ),
                    ),
                   SliverToBoxAdapter(child: PriceWidget(total: total,)),
                    const SliverToBoxAdapter(
                      child: CartButton(),
                    ),
                  ]
                : [
                    SliverToBoxAdapter(
                      child: Container(
                        height: height * 0.8,
                        alignment: Alignment.center,
                        child: const Text(
                          'Cart is Empty, Explore Product to buy ',
                          style: TextStyle(
                            color: Color1.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
          );
        },
      ),
    );
  }
}

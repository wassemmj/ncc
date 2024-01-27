import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color1.dart';
import '../../../logic/order_user_cubit/order_user_cubit.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({Key? key, required this.number, required this.address}) : super(key: key);

  final String number;
  final String address;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<OrderUserCubit, OrderUserState>(
      listener: (context, state) {
        if(state.status == OrderUserStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order done Successfully')));
        } else if(state.status == OrderUserStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('try again with full details')));
        }
      },
      builder: (context, state) {
        if(state.status == OrderUserStatus.loading) {
          return Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          );
        }
        return Container(
          alignment: Alignment.topRight,
          child: ElevatedButton(
              onPressed: () async {
                await BlocProvider.of<OrderUserCubit>(context).checkOut(number, address);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Check Out',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Icon(Icons.arrow_forward_outlined, size: 18)
                ],
              )),
        );
      },
    );
  }
}

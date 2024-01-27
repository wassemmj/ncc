import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/delete_cubit/delete_cubit.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<DeleteCubit, DeleteState>(
      listener: (context, state) {
        if(state.status == DeleteStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product deleted Successfully')));
        }
      },
      child: Container(
        width: (height / 21.68),
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.03),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () async {
            await BlocProvider.of<DeleteCubit>(context)
                .deleteProduct(id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: (height / 39.42),
          ),
        ),
      ),
    );
  }
}

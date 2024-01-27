import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState.initial());

  var details;

  Future getDetails(int productId) async {
    emit(state.copyWith(status: DetailsStatus.loading));
    try {
      details = await DetailsRepo.getDetails(productId);
      emit(state.copyWith(status: DetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DetailsStatus.error));
    }
  }
}

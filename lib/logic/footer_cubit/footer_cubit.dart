import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncc_app/data/repo/footer_repo.dart';

part 'footer_state.dart';

class FooterCubit extends Cubit<FooterState> {
  FooterCubit() : super(FooterState.initial());

  var footer;

  Future getFooter() async {
    emit(state.copyWith(status: FooterStatus.loading));
    try {
      footer = await FooterRepo.getFooter();
      emit(state.copyWith(status: FooterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FooterStatus.error));
    }
  }

  Future addFooter(
      String email,
      String address,
      String description,
      List numbers,
      String fAccount,
      String iAccount,
      String tAccount,
      ) async {
    emit(state.copyWith(status: FooterStatus.loading));
    try {
      footer = await FooterRepo.addFooter(email, address, description, numbers, fAccount, iAccount, tAccount);
      emit(state.copyWith(status: FooterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FooterStatus.error));
    }
  }

  Future editFooter(
      int id,
      String email,
      String address,
      String description,
      List numbers,
      String fAccount,
      String iAccount,
      String tAccount,
      ) async {
    emit(state.copyWith(status: FooterStatus.loading));
    try {
      footer = await FooterRepo.editFooter(id, email, address, description, numbers, fAccount, iAccount, tAccount);
      emit(state.copyWith(status: FooterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FooterStatus.error));
    }
  }

  Future deleteFooter(
      int id,
      ) async {
    emit(state.copyWith(status: FooterStatus.loading));
    try {
      footer = await FooterRepo.deleteFooter(id);
      emit(state.copyWith(status: FooterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FooterStatus.error));
    }
  }
}

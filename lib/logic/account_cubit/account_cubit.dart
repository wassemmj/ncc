import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncc_app/data/repo/account_repo.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState.initial());

  var account;

  Future getAccount() async {
    emit(state.copyWith(status: AccountStatus.loading));
    try {
      account = await AccountRepo.getAccount();
      emit(state.copyWith(status: AccountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
    }
  }

  Future updateAccount(String name,String email, String address) async {
    emit(state.copyWith(status: AccountStatus.loading));
    try {
      await AccountRepo.updateAccount(name, email, address);
      emit(state.copyWith(status: AccountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncc_app/data/repo/users_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  var users;
  var user;

  Future getAllUser() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      users = await UsersRepo.getAllUser();
      emit(state.copyWith(status: UserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future findUser(int userId) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      user = await UsersRepo.findUser(userId);
      emit(state.copyWith(status: UserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future makeAdmin(int userId) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await UsersRepo.makeAdmin(userId);
      emit(state.copyWith(status: UserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }
}

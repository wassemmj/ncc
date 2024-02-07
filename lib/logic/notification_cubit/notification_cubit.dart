import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ncc_app/core/notify_sevices.dart';
import 'package:ncc_app/data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  var notification;

  Future getNotification() async {
    emit(state.copyWith(status: NotificationStatus.loading));
    try {
      notification = await NotificationRepo.getNotification();
      print(notification) ;
      emit(state.copyWith(status: NotificationStatus.success));
      var nn = notification['notifications'];
      for(int i = 0;i<nn.length;i++) {
        var f = nn[i]['data'];
        NotifyServices().showNotification(id: nn[i]['notifiable_id'],title: f['message'],body: f['shipping_address']);
      }
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.error));
    }
  }

  Future markAsRead(String id) async {
    emit(state.copyWith(status: NotificationStatus.loading));
    try {
      await NotificationRepo.markAsRead(id);
      emit(state.copyWith(status: NotificationStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.error));
    }
  }

  Future deleteNotification(String id) async {
    emit(state.copyWith(status: NotificationStatus.loading));
    try {
      await NotificationRepo.deleteNotification(id);
      emit(state.copyWith(status: NotificationStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.error));
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/service/service.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  /*
      Get Data Schedule Doctor for Date
  */
  Future<void> getSchedule(doctorId, date) async {
    ApiReturnValue<List<Schedule>> result =
        await ScheduleService.getData(doctorId, date);

    if (result.value != null) {
      emit(ScheduleLoaded(result.value!));
    } else {
      emit(ScheduleLoadingFailed(result.message!));
    }
  }
}

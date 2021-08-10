import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/service/service.dart';

part 'doctor_schedule_state.dart';

class DoctorScheduleCubit extends Cubit<DoctorScheduleState> {
  DoctorScheduleCubit() : super(DoctorScheduleInitial());

  /*
      Get Data Schedule Doctor for Date
  */
  Future<void> getDoctorSchedule() async {
    ApiReturnValue<List<DoctorSchedule>> result =
        await DoctorScheduleService.getData();

    if (result.value != null) {
      emit(DoctorScheduleLoaded(result.value!));
    } else {
      emit(DoctorScheduleLoadingFailed(result.message!));
    }
  }
}

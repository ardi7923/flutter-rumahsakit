import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/service/service.dart';

part 'patient_schedule_state.dart';

class PatientScheduleCubit extends Cubit<PatientScheduleState> {
  PatientScheduleCubit() : super(PatientScheduleInitial());

    /*
      Get Data Schedule Doctor for Date
  */
  Future<void> getPatientSchedule() async {
    ApiReturnValue<List<PatientSchedule>> result =
        await PatientScheduleService.getData();

    if (result.value != null) {
      emit(PatientScheduleLoaded(result.value!));
    } else {
      emit(PatientScheduleLoadingFailed(result.message!));
    }
  }
}

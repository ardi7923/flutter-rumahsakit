import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/service/service.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  /*
      Get Data Doctor
  */
  Future<void> getDoctor() async {
    ApiReturnValue<List<Doctor>> result = await DoctorService.getData();

    if (result.value != null) {
      emit(DoctorLoaded(result.value!));
    } else {
      emit(DoctorLoadingFailed(result.message!));
    }
  }
}

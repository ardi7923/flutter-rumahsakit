import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/service/service.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  /*
      Get Data Cashier
  */
  Future<void> getPatient(search) async {
    ApiReturnValue<List<Patient>> result =  await PatientService.getData(search);

    if (result.value != null) {
      emit(PatientLoaded(result.value!));
    } else {
      emit(PatientLoadingFailed(result.message!));
    }
  }
}

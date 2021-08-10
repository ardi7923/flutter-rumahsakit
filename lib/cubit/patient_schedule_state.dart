part of 'patient_schedule_cubit.dart';

abstract class PatientScheduleState extends Equatable {
  const PatientScheduleState();

  @override
  List<Object> get props => [];
}

class PatientScheduleInitial extends PatientScheduleState {}

class PatientScheduleLoaded extends PatientScheduleState {
  final List<PatientSchedule> patientSchedules;

  PatientScheduleLoaded(this.patientSchedules); 

  @override
  List<Object> get props => [patientSchedules];  
}

class PatientScheduleLoadingFailed extends PatientScheduleState {
  final String message;
  PatientScheduleLoadingFailed(this.message);
  
  @override
  List<Object> get props => [message];
}

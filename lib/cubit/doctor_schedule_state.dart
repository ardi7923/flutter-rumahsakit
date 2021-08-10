part of 'doctor_schedule_cubit.dart';

abstract class DoctorScheduleState extends Equatable {
  const DoctorScheduleState();

  @override
  List<Object> get props => [];
}

class DoctorScheduleInitial extends DoctorScheduleState {}

class DoctorScheduleLoaded extends DoctorScheduleState {
  final List<DoctorSchedule> doctorSchedules;

  DoctorScheduleLoaded(this.doctorSchedules); 

  @override
  List<Object> get props => [doctorSchedules];  
}

class DoctorScheduleLoadingFailed extends DoctorScheduleState {
  final String message;
  DoctorScheduleLoadingFailed(this.message);
  
  @override
  List<Object> get props => [message];
}
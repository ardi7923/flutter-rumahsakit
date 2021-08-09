part of 'doctor_cubit.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}



class DoctorLoaded extends DoctorState {
  final List<Doctor> doctors;

  DoctorLoaded(this.doctors); 

  @override
  List<Object> get props => [doctors];  
}

class DoctorLoadingFailed extends DoctorState {
  final String message;
  DoctorLoadingFailed(this.message);
  
  @override
  List<Object> get props => [message];
}
part of 'patient_cubit.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}


class PatientLoaded extends PatientState {
  final List<Patient> patients;

  PatientLoaded(this.patients); 

  @override
  List<Object> get props => [patients];  
}

class PatientLoadingFailed extends PatientState {
  final String message;
  PatientLoadingFailed(this.message);
  
  @override
  List<Object> get props => [message];
}
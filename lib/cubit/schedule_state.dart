part of 'schedule_cubit.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<Schedule> schedules;

  ScheduleLoaded(this.schedules); 

  @override
  List<Object> get props => [schedules];  
}

class ScheduleLoadingFailed extends ScheduleState {
  final String message;
  ScheduleLoadingFailed(this.message);
  
  @override
  List<Object> get props => [message];
}
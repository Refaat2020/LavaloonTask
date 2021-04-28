part of 'time_cubit.dart';

abstract class TimeState extends Equatable {
  const TimeState();
}

class TimeInitial extends TimeState {
  @override
  List<Object> get props => [];
}
class TimeLoading extends TimeState {
  @override
  List<Object> get props => [];
}
class TimeFetched extends TimeState {
  List<TimeModel>timeList;

  TimeFetched({this.timeList});

  @override
  List<Object> get props => [];
}
class TimeError extends TimeState {
  String error;

  TimeError(this.error);

  @override
  List<Object> get props => [];
}

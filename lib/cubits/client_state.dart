part of 'client_cubit.dart';

abstract class ClientState extends Equatable {
  const ClientState();
}

class ClientInitial extends ClientState {
  @override
  List<Object> get props => [];
}
class ClientLoading extends ClientState {
  @override
  List<Object> get props => [];
}
class ClientFetched extends ClientState {

  @override
  List<Object> get props => [];
}
class ClientError extends ClientState {
  String error;

  ClientError(this.error);

  @override
  List<Object> get props => [];
}


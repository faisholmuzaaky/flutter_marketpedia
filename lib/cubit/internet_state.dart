part of 'internet_cubit.dart';

sealed class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

final class InternetInitial extends InternetState {}

final class InternetConnected extends InternetState {
  final bool isConnected;
  const InternetConnected(this.isConnected);
  @override
  List<Object> get props => [isConnected];
}

final class InternetFailed extends InternetState {}

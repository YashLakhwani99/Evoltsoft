part of 'charging_station_bloc.dart';

@immutable
sealed class ChargingStationEvent {}

class ChargingStationInitialFetchEvent extends ChargingStationEvent {}

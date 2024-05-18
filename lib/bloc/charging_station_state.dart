// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'charging_station_bloc.dart';

@immutable
sealed class ChargingStationState {}

abstract class ChargingStationActionState extends ChargingStationState {}

final class ChargingStationInitial extends ChargingStationState {}

class ChargingStationFetchingSuccess extends ChargingStationState {
  final List<ChargingStationModel> chargingStations;
  ChargingStationFetchingSuccess({
    required this.chargingStations,
  });
}

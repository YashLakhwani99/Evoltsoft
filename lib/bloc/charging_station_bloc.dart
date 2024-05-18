import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:evoltsoft/models/charging_station_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'charging_station_event.dart';
part 'charging_station_state.dart';

class ChargingStationBloc
    extends Bloc<ChargingStationEvent, ChargingStationState> {
  ChargingStationBloc() : super(ChargingStationInitial()) {
    on<ChargingStationInitialFetchEvent>(chargingStationInitialFetchEvent);
  }

  Future<void> chargingStationInitialFetchEvent(
      ChargingStationInitialFetchEvent event,
      Emitter<ChargingStationState> emit) async {
    var client = http.Client();
    try {
      List<ChargingStationModel> chargingStations = [];
      var response = await client.get(
        Uri.parse("https://mocki.io/v1/15e7d96d-199c-4397-adc7-78bc7ff96a19"),
      );
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        ChargingStationModel stations =
            ChargingStationModel.fromJson(result[i] as Map<String, dynamic>);
        chargingStations.add(stations);
      }

      emit(
        ChargingStationFetchingSuccess(chargingStations: chargingStations),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}

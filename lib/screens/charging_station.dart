// ignore_for_file: type_literal_in_constant_pattern, avoid_unnecessary_containers

import 'package:evoltsoft/bloc/charging_station_bloc.dart';
import 'package:evoltsoft/components/charging_tile.dart';
import 'package:evoltsoft/screens/station_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChargingStationList extends StatefulWidget {
  const ChargingStationList({super.key});

  @override
  State<ChargingStationList> createState() => _ChargingStationListState();
}

class _ChargingStationListState extends State<ChargingStationList> {
  final Color _color = const Color.fromRGBO(24, 63, 213, 1);
  final ChargingStationBloc chargingStationBloc = ChargingStationBloc();
  @override
  void initState() {
    chargingStationBloc.add(ChargingStationInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Nearby Chargers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: MediaQuery.sizeOf(context).width,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 40,
                    child: TextField(
                      controller: searchController,
                      textAlign: TextAlign.start,
                      cursorColor: _color,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(228, 228, 230, 1),
                        contentPadding: const EdgeInsets.all(1),
                        focusColor: _color,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: _color,
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: _color,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.mic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: BlocConsumer<ChargingStationBloc, ChargingStationState>(
          bloc: chargingStationBloc,
          listenWhen: (previous, current) =>
              current is ChargingStationActionState,
          buildWhen: (previous, current) =>
              current is! ChargingStationActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case ChargingStationFetchingSuccess:
                final successState = state as ChargingStationFetchingSuccess;
                return Container(
                  child: ListView.builder(
                    itemCount: successState.chargingStations.length,
                    itemBuilder: (context, index) {
                      var out = successState.chargingStations[index];
                      return ChargingTile(
                        evseId: successState.chargingStations[index].evseId,
                        name: successState.chargingStations[index].evseName,
                        imageUrl: out.images.isNotEmpty
                            ? out.images[0].url
                            : "https://images.unsplash.com/photo-1617886322168-72b886573c35?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        status: out.status,
                        voltage: out.connectors[0].maxVoltage.toString(),
                        type: out.capabilities[0],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StationPage(
                              uid: out.uid,
                              color: _color,
                              evseId: out.evseId,
                              name: out.evseName,
                              imageUrl: out.images.isNotEmpty
                                  ? out.images[0].url
                                  : "https://images.unsplash.com/photo-1617886322168-72b886573c35?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              status: out.status,
                              voltage: out.connectors[0].maxVoltage.toString(),
                              type: out.capabilities[0],
                              serviceFee: out.serviceFeeVat,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

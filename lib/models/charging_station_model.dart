

import 'package:evoltsoft/models/connector_model.dart';
import 'package:evoltsoft/models/image_model.dart';

class ChargingStationModel {
  String uid;
  String evseId;
  String status;
  List<Connector> connectors;
  String? floorLevel;
  List<String> capabilities;
  List<String>? parkingRestrictions;
  String evseName;
  int serviceFeeVat;
  List<Image> images;

  ChargingStationModel({
    required this.uid,
    required this.evseId,
    required this.status,
    required this.connectors,
    this.floorLevel,
    required this.capabilities,
    this.parkingRestrictions,
    required this.evseName,
    required this.serviceFeeVat,
    required this.images,
  });

  factory ChargingStationModel.fromJson(Map<String, dynamic> json) =>
      ChargingStationModel(
        uid: json["uid"],
        evseId: json["evse_id"],
        status: json["status"],
        connectors: List<Connector>.from(
            json["connectors"].map((x) => Connector.fromJson(x))),
        floorLevel: json["floor_level"],
        capabilities: List<String>.from(json["capabilities"].map((x) => x)),
        parkingRestrictions: json["parking_restrictions"] == null
            ? []
            : List<String>.from(json["parking_restrictions"]!.map((x) => x)),
        evseName: json["evse_name"],
        serviceFeeVat: json["service_fee_vat"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "evse_id": evseId,
        "status": status,
        "connectors": List<dynamic>.from(connectors.map((x) => x.toJson())),
        "floor_level": floorLevel,
        "capabilities": List<dynamic>.from(capabilities.map((x) => x)),
        "parking_restrictions": parkingRestrictions == null
            ? []
            : List<dynamic>.from(parkingRestrictions!.map((x) => x)),
        "evse_name": evseName,
        "service_fee_vat": serviceFeeVat,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

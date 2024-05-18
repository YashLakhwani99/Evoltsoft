
class Connector {
  String termsAndConditions;
  int maxVoltage;
  int maxElectricPower;
  String? status;

  Connector({
    required this.termsAndConditions,
    required this.maxVoltage,
    required this.maxElectricPower,
    this.status,
  });

  factory Connector.fromJson(Map<String, dynamic> json) => Connector(
        termsAndConditions: json["terms_and_conditions"],
        maxVoltage: json["max_voltage"],
        maxElectricPower: json["max_electric_power"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "terms_and_conditions": termsAndConditions,
        "max_voltage": maxVoltage,
        "max_electric_power": maxElectricPower,
        "status": status,
      };
}

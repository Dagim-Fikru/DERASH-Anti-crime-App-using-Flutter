class Station {
  String? id;
  String stationemail;
  String stationlocation;
  Station({
    this.id,
    required this.stationemail,
    required this.stationlocation,
  });

  factory Station.fromJson(Map<String, dynamic> json){
    return Station(
        id: json["_id"],
        stationemail: json["stationemail"],
        stationlocation: json["stationlocation"],
      );
  }
    Map<String, dynamic> toJson() => {
         "id":id,
        "stationemail": stationemail,
        "stationlocation": stationlocation,
      };
}

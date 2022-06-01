class Station {
  String? id;
  String? stationame;
  String stationemail;
  String stationlocation;
  Station({
    this.id,
    this.stationame,
    required this.stationemail,
    required this.stationlocation,
  });

  factory Station.fromJson(Map<String, dynamic> json){
    return Station(
        id: json["id"],
        stationemail: json["stationemail"],
        stationame: json["stationame"],
        stationlocation: json["stationlocation"],
      );
  }
    Map<String, dynamic> toJson() => {
         "id":id,
        "stationemail": stationemail,
        "stationame": stationame,
        "stationlocation": stationlocation,
      };
}

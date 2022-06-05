class Stats {
  String name;
  int value;

  Stats({required this.name, required this.value});
  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
      // return User(
      name: json['name'],
      value: json["value"]);

  // )
  Map<String, dynamic> toJson() => {"name": name, "value": value};
}

class Report {
  String? userId;
  DateTime date;
  String location;
  String description;
  String? img;
  Report(
      { this.userId,
      required this.location,
      required this.date,
      required this.description,
      this.img});

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        // return User(
        userId: json["userId"],
        date: json["date"],
        location: json["location"],
        description: json["description"],
        img: json["description"],
      );

  // )
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "date": date,
        "location": location,
        "description": description,
        "img": img,
      };
}

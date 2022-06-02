
class Station {
  final int id;
  final String email;
  final String location;
  final bool isComplete;

  Station({
    required this.id,
    required this.email,
    required this.location,
    this.isComplete = false,
  });

  Station copyWith(
      {int? id, String? name, String? location, bool? isComplete}) {
    return Station(
      id: id ?? this.id,
      email: name ?? email,
      location: location ?? this.location,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

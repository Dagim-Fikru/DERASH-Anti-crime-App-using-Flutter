import 'package:flutter/painting.dart';

class Station {
  final String id;
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
      {String? id, String? name, String? location, bool? isComplete}) {
    return Station(
      id: id ?? this.id,
      email: name ?? this.email,
      location: location ?? this.location,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

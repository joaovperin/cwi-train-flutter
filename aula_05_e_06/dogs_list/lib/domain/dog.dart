import 'dart:convert';

class DogModel {
  final String breed;
  final String image;

  const DogModel(
    this.breed, {
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'breed': breed,
      'image': image,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      map['breed'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source));
}

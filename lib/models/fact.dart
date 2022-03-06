import 'dart:math';

class FactModel {
  final String fact;
  final String imageURL;
  final int length;

  FactModel( {required this.fact, required this.length,required this.imageURL});
  factory FactModel.fromJson(Map<String, dynamic> json) {
    return FactModel(fact: json['fact'],
        length: json['length'],
        imageURL: "${200+Random().nextInt(90)}/${300+Random().nextInt(90)}");
  }
}

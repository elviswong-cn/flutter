import 'package:flutter_trip/model/common_model.dart';

class GridNavModel {
  final CommonModel hotel;
  final CommonModel flight;
  final CommonModel travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
      hotel: CommonModel.fromJson(json['hotel']),
      flight: CommonModel.fromJson(json['flight']),
      travel: CommonModel.fromJson(json['travel']),
    );
  }

  Map<String, dynamic> toJson() => {
        'hotel': this.hotel.toJson(),
        'flight': this.flight.toJson(),
        'travel': this.travel.toJson(),
      };
}

import 'dart:io';
import 'package:flutter/material.dart';

class Car {
  final String make;
  final String model;
  final String fuelType;
  final String registration;
  final String milage;
  final String transmission;
  final String location;
  final double price;
  final int power;
  final double consumer;
  final List<File> images;
  final List<String> equipment;
  final String bodyColor;
  final String interiorColor;
  final String upholstery;
  final String description;
  final String bodyType;

  Car({
    required this.make,
    required this.model,
    required this.bodyType,
    required this.fuelType,
    required this.registration,
    required this.milage,
    required this.transmission,
    required this.location,
    required this.price,
    required this.power,
    required this.consumer,
    required this.images,
    this.equipment = const [],
    this.bodyColor = '',
    this.interiorColor = '',
    this.upholstery = '',
    this.description = '',
  });

  Car copyWith({
    String? make,
    String? model,
    String? fuelType,
    String? registration,
    String? mileage,
    String? transmission,
    String? location,
    double? price,
    int? power,
    double? consumer,
    List<File>? images,
    List<String>? equipment,
    String? bodyColor,
    String? interiorColor,
    String? upholstery,
    String? description,
  }) {
    return Car(
      make: make ?? this.make,
      model: model ?? this.model,
      bodyType: bodyType ?? this.bodyType,
      fuelType: fuelType ?? this.fuelType,
      registration: registration ?? this.registration,
      milage: milage ?? this.milage,
      transmission: transmission ?? this.transmission,
      location: location ?? this.location,
      price: price ?? this.price,
      power: power ?? this.power,
      consumer: consumer ?? this.consumer,
      images: images ?? this.images,
      equipment: equipment ?? this.equipment,
      bodyColor: bodyColor ?? this.bodyColor,
      interiorColor: interiorColor ?? this.interiorColor,
      upholstery: upholstery ?? this.upholstery,
      description: description ?? this.description,
    );
  }
}

class CarProvider with ChangeNotifier {
  final List<Car> _cars = [];
  final Set<int> _favoriteCars = {};

  List<Car> get cars => _cars;
  Set<int> get favoriteCars => _favoriteCars;

  void addCar(Car car) {
    _cars.add(car);
    notifyListeners();
  }

  void updateCar(Car updatedCar, int index) {
    if (index >= 0 && index < _cars.length) {
      _cars[index] = updatedCar;
      notifyListeners();
    }
  }

  void deleteCar(int index) {
    if (index >= 0 && index < _cars.length) {
      _cars.removeAt(index);
      notifyListeners();
    }
  }


  void toggleFavorite(int index) {
    if (_favoriteCars.contains(index)) {
      _favoriteCars.remove(index);
    } else {
      _favoriteCars.add(index);
    }
    notifyListeners();
  }

  bool isFavorite(int index) {
    return _favoriteCars.contains(index);
  }
}

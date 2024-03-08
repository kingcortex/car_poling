import 'package:car_pooling/model/trajet.dart';

class Data {
  static List<Trajet> listTrajet = [
    Trajet(
      start: "Yamoussoukro",
      end: "San Pedro",
      modelCar: "BMW",
      imageCarPath: 'assets/car1.png',
      time: 2,
      price: 10000,
    ),
    Trajet(
      start: "Bouaké",
      end: "Korhogo",
      modelCar: "Hyundai",
      imageCarPath: 'assets/car2.png',
      time: 2,
      price: 6000,
    ),
    Trajet(
      start: "San Pedro",
      end: "Bouaké",
      modelCar: "Mercedess",
      imageCarPath: 'assets/car3.png',
      time: 2,
      price: 8000,
    ),
    Trajet(
      start: "Abidjan",
      end: "Yamoussoukro",
      modelCar: "Toyota",
      imageCarPath: 'assets/car4.png',
      time: 2,
      price: 12000,
    ),
  ];
}

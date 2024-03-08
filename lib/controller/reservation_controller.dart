import 'package:car_pooling/model/trajet.dart';
import 'package:get/get.dart';

class ReservationsController extends GetxController {
  List<Trajet> reservations = [];

  void addReservations({required Trajet trajet}) {
    reservations.add(trajet);
    update();
  }
}

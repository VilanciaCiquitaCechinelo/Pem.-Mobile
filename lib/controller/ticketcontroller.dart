import 'package:kaiticket/models/ticketmodel.dart';

class TiketController {
  Tiket? tiket;

  void buatTiket(String titikAwal, String titikAkhir) {
    tiket = Tiket(titikAwal: titikAwal, titikAkhir: titikAkhir);
  }
}

class Tiket {
  String titikAwal;
  String titikAkhir;
  DateTime? tanggalPergi;
  DateTime? tanggalPulang;
  int jumlahPenumpang;

  Tiket({
    required this.titikAwal,
    required this.titikAkhir,
    this.tanggalPergi,
    this.tanggalPulang,
    this.jumlahPenumpang = 1,
  });
}

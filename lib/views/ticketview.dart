import 'package:flutter/material.dart';

class TiketSayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Align(
          alignment: Alignment.topCenter, // Mengatur posisi ke atas tengah
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  // Aksi yang dijalankan ketika kotak awal ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PilihStasiunPage('Titik Awal')),
                  );
                },
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.grey[100],
                  child: Center(
                    child: Text(
                      'Titik Awal',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara kotak awal dan kotak akhir
              InkWell(
                onTap: () {
                  // Aksi yang dijalankan ketika kotak akhir ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PilihStasiunPage('Titik Akhir')),
                  );
                },
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.grey[100],
                  child: Center(
                    child: Text(
                      'Titik Akhir',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara kotak akhir dan kotak tanggal
              InkWell(
                onTap: () {
                  // Aksi yang dijalankan ketika kotak tanggal ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PilihTanggalPage()),
                  );
                },
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.grey[100],
                  child: Center(
                    child: Text(
                      'Pilih Tanggal',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara kotak tanggal dan kotak penumpang
              InkWell(
                onTap: () {
                  // Aksi yang dijalankan ketika kotak penumpang ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TambahPenumpangPage()),
                  );
                },
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.grey[100], // Warna latar belakang kotak penumpang
                  child: Center(
                    child: Text(
                      'Penumpang',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara kotak penumpang dan kotak pencarian tiket
              InkWell(
                onTap: () {
                  // Aksi yang dijalankan ketika kotak pencarian tiket ditekan
                  // Tambahkan logika atau navigasi sesuai kebutuhan
                },
                child: Container(
                  width: 400,
                  height: 60,
                  color: Colors.orange, // Warna latar belakang kotak pencarian tiket
                  child: Center(
                    child: Text(
                      'Cari Tiket',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TambahPenumpangPage extends StatefulWidget {
  @override
  _TambahPenumpangPageState createState() => _TambahPenumpangPageState();
}

class _TambahPenumpangPageState extends State<TambahPenumpangPage> {
  TextEditingController _controller = TextEditingController();
  int _jumlahPenumpang = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Penumpang'), // Judul halaman penambahan penumpang
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Jumlah Penumpang:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_jumlahPenumpang > 1) {
                        _jumlahPenumpang--;
                      }
                    });
                  },
                ),
                Text(
                  '$_jumlahPenumpang',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _jumlahPenumpang++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lakukan aksi sesuai kebutuhan dengan jumlah penumpang yang telah dipilih (_jumlahPenumpang)
              },
              child: Text('Lanjutkan'),
            ),
          ],
        ),
      ),
    );
  }
}

class PilihTanggalPage extends StatefulWidget {
  @override
  _PilihTanggalPageState createState() => _PilihTanggalPageState();
}

class _PilihTanggalPageState extends State<PilihTanggalPage> {
  DateTime? _tanggalPulang;
  DateTime? _tanggalPergi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Tanggal'), // Judul halaman pemilihan tanggal
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Menampilkan picker tanggal untuk tanggal pergi
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (pickedDate != null && pickedDate != _tanggalPergi) {
                  setState(() {
                    _tanggalPergi = pickedDate;
                  });
                  print('Tanggal Pergi: $_tanggalPergi');
                }
              },
              child: Text(_tanggalPergi != null
                  ? 'Pergi: ${_tanggalPergi!.toLocal()}'.split(' ')[0]
                  : 'Pilih Tanggal Pergi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Menampilkan picker tanggal untuk tanggal pulang
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (pickedDate != null && pickedDate != _tanggalPulang) {
                  setState(() {
                    _tanggalPulang = pickedDate;
                  });
                  print('Tanggal Pulang: $_tanggalPulang');
                }
              },
              child: Text(_tanggalPulang != null
                  ? 'Pulang: ${_tanggalPulang!.toLocal()}'.split(' ')[0]
                  : 'Pilih Tanggal Pulang'),
            ),
          ],
        ),
      ),
    );
  }
}

class PilihStasiunPage extends StatelessWidget {
  final String jenisStasiun;

  PilihStasiunPage(this.jenisStasiun);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih $jenisStasiun'), // Judul halaman sesuai dengan jenis stasiun
      ),
      // Widget daftar nama kereta untuk pemilihan stasiun dapat ditambahkan di sini
      body: Center(
        child: Text('Halaman Pilih $jenisStasiun'), // Konten halaman pilih stasiun
      ),
    );
  }
}
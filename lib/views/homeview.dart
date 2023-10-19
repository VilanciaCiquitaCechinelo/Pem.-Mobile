import 'package:flutter/material.dart';
import 'package:kaiticket/controller/homecontroller.dart';


class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, Selamat Datang \nDi Layanan KAI Access'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: controller.buildTopItem('Kotak Atas', 'images/logo.png'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                controller.buildItem('Antar Kota', 'images/antarkota.png'),
                SizedBox(width: 20),
                controller.buildItem('Lokal', 'images/lokal.png'),
                SizedBox(width: 20),
                controller.buildItem('Bandara', 'images/bandara.png'),
              ],
            ),
            SizedBox(height: 20),
            controller.buildPromotionBox('Promo', 'images/promo.jpeg'),
          ],
        ),
      ),
    );
  }
}



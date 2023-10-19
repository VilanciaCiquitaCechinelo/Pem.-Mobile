import 'package:flutter/material.dart';

class HomeController {
  Widget buildItem(String text, String imagePath) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[100], // Ganti dengan warna latar belakang yang sesuai
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildTopItem(String text, String imagePath) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[100], // Ganti dengan warna latar belakang yang sesuai
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildPromotionBox(String text, String imagePath) {
    // Widget untuk kotak promosi
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[100], // Warna latar belakang kotak promosi
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                width: 280,
                height: 150,
                fit: BoxFit
                    .cover, // Mengatur agar gambar memenuhi kotak tanpa mengubah aspek rasio
              ),
            ),
          ),
        ],
      ),
    );
  }
}


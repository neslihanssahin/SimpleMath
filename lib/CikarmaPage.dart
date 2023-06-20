import 'package:flutter/material.dart';
import 'dart:math';

class CikarmaPage extends StatefulWidget {
  @override
  _CikarmaPageState createState() => _CikarmaPageState();
}

class _CikarmaPageState extends State<CikarmaPage> {
  int sayi1 = 0;
  int sayi2 = 0;
  int fark = 0;
  TextEditingController sonucController = TextEditingController();
  String kontrolMesaji = '';
  int denemeHakki = 3;
  bool sonucGirildi = false;
  int skor=0;

  @override
  void initState() {
    super.initState();
    rastgeleSayiGetir();
  }

  void rastgeleSayiGetir() {
    setState(() {
      sayi1 = Random().nextInt(50) + 1;
      sayi2 = Random().nextInt(sayi1);
      fark = sayi1 - sayi2;
      kontrolMesaji = '';
      denemeHakki = 3;
      sonucGirildi = false;
      sonucController.text =
      '';
    });
  }

  void sonucuKontrolEt() {
    int girilenSonuc = int.tryParse(sonucController.text) ?? 0;
    setState(() {
      if (girilenSonuc == fark) {
        kontrolMesaji = 'Tebrikler, doğru sonuç!';
        denemeHakki = 0;
        skor+=5;
        sonucController.text =
        '';
        Future.delayed(Duration(seconds: 1), () {
          rastgeleSayiGetir();
        });
      } else {
        denemeHakki--;
        if (denemeHakki == 0) {
          kontrolMesaji = 'Deneme hakkınız kalmadı! Doğru sonuç: $fark';
          skor-=2;
          sonucController.text =
          '';
          Future.delayed(Duration(seconds: 2), () {
            rastgeleSayiGetir();
          });
        } else {
          kontrolMesaji = 'Yanlış sonuç! ';
          sonucController.text =
          '';
        }
      }
      if (denemeHakki == 0) {
        sonucGirildi = false;
      }
    });
  }

  void sonucDegisiklikKontrolu(String value) {
    setState(() {
      if (value.isNotEmpty) {
        sonucGirildi = true;
      } else {
        sonucGirildi = false;
      }
    });
  }

  @override
  void dispose() {
    sonucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Çıkarma'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Deneme Hakkı: $denemeHakki',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Skor: $skor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: rastgeleSayiGetir,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      child: Text(
                        sayi1.toString(),
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(fontSize: 100),
                    ),
                    ElevatedButton(
                      onPressed: rastgeleSayiGetir,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      child: Text(
                        sayi2.toString(),
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: sonucController,
                  keyboardType: TextInputType.number,
                  onChanged: sonucDegisiklikKontrolu,
                  decoration: InputDecoration(
                    hintText: 'Sonucu girin',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: sonucGirildi ? sonucuKontrolEt : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.grey,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      'Kontrol Et',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  kontrolMesaji,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

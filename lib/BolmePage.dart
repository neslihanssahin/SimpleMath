import 'package:flutter/material.dart';
import 'dart:math';

class BolmePage extends StatefulWidget {
  @override
  _BolmePageState createState() => _BolmePageState();
}

class _BolmePageState extends State<BolmePage> {
  int sayi1 = 0;
  int sayi2 = 0;
  double bolum = 0;
  int tamBolum = 0;
  TextEditingController sonucController = TextEditingController();
  String kontrolMesaji = '';
  int denemeHakki = 3;
  int skor=0;

  void rastgeleSayiGetir() {
    setState(() {
      sayi1 = Random().nextInt(50) + 1;
      sayi2 = Random().nextInt(50) + 1;
      if (sayi2 == 0) {
        sayi2 = 1;
      }
      while (sayi1 % sayi2 != 0) {
        sayi1 = Random().nextInt(50) + 1;
        sayi2 = Random().nextInt(50) + 1;
        if (sayi2 == 0) {
          sayi2 = 1;
        }
      }
      bolum = sayi1 / sayi2;
      tamBolum = bolum.toInt();
      kontrolMesaji = '';
      denemeHakki = 3;
      sonucController.text =
      '';
    });
  }

  void sonucuKontrolEt() {
    double girilenSonuc = double.tryParse(sonucController.text) ?? 0;
    setState(() {
      if (girilenSonuc == bolum) {
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
          kontrolMesaji = 'Deneme hakkınız kalmadı!Doğru sonuç: $tamBolum';
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
    });
  }

  void yeniSayilarGetir() {
    sonucController.clear();
    rastgeleSayiGetir();
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
        backgroundColor: Colors.purpleAccent,
        title: Text('Bölme'),
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
                        primary: Colors.purpleAccent,
                      ),
                      child: Text(
                        sayi1.toString(),
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                    Text(
                      '÷',
                      style: TextStyle(fontSize: 100),
                    ),
                    ElevatedButton(
                      onPressed: rastgeleSayiGetir,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purpleAccent,
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
                  decoration: InputDecoration(
                    hintText: 'Sonucu girin',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      kontrolMesaji = '';
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: denemeHakki > 0 && sonucController.text.isNotEmpty
                      ? sonucuKontrolEt
                      : null,
                  style: ElevatedButton.styleFrom(primary: Colors.green),
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

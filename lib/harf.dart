import 'package:flutter/material.dart';

class ikinciSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("    Vize/Final Harf Hesaplama"),
      ),
      body: Yap2(),
    );
  }
}

class Yap2 extends StatefulWidget {
  @override
  _Yap2State createState() => _Yap2State();
}
class _Yap2State extends State<Yap2> {
  num birincisayi = 0, ikincisayi = 0, sonuc = 0;
  TextEditingController textC1 = TextEditingController();
  TextEditingController textC2 = TextEditingController();

  notHesapla() {
    setState(() {
      birincisayi = num.parse(textC1.text);
      ikincisayi = num.parse(textC2.text);
      sonuc = (birincisayi * 0.40) + (ikincisayi*0.60);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        50,
      ),
      child: Column(
        children: <Widget>[
          Text("Notunuz: " + "$sonuc " + ' , ' + " Harf Aralığınız: "+ getStatus, style: TextStyle(fontSize: 15),),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              hintText: 'Vize',
            ),
            controller: textC1,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              hintText: 'Final',
            ),
            controller: textC2,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: notHesapla,
            child: Text("Vize/Final Not Hesapla"),
          ),
        ],
      ),
    );
  }

  String get getStatus{
    String message = "";
    if (this.sonuc >= 90) {
      message = "AA";
    } else if (this.sonuc >= 85 && this.sonuc <90) {
      message = "BA";
    } else if (this.sonuc >= 75 && this.sonuc <85) {
      message = "BB";
    } else if (this.sonuc >= 65 && this.sonuc <75) {
      message = "CB";
    } else if (this.sonuc >= 55 && this.sonuc <65) {
      message = "CC";
    } else if (this.sonuc >= 45 && this.sonuc <55) {
      message = "DC";
    } else if (this.sonuc >= 35 && this.sonuc <45) {
      message = "DD";
    }else{
      message = "FF";
    }
    return message;
  }
}
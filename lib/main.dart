import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesap_makinesi/harf.dart';
import 'package:hesap_makinesi/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int birinciSayi;
  late int ikinciSayi;
  late String gecmis='';
  late String gosterim='';
  late String sonuc;
  late String islem;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if(btnVal == 'C'){
      gosterim= '';
      birinciSayi=0;
      ikinciSayi=0;
      sonuc='';
    } else if(btnVal == 'AC') {
      gosterim= '';
      birinciSayi=0;
      ikinciSayi=0;
      sonuc='';
      gecmis='';
    } else if(btnVal == '+/-') {
        if(gosterim[0] != '-') {
          sonuc = '-'+gosterim;
        } else{
            sonuc = gosterim.substring(1);
        }
    } else if(btnVal == '<') {
        sonuc = gosterim.substring(0, gosterim.length - 1 );
    } else if(btnVal == '+'|| btnVal == '-'|| btnVal == 'X'|| btnVal == '/') {
        birinciSayi = int.parse(gosterim);
        sonuc='';
        islem=btnVal;
    } else if(btnVal == '=') {
      ikinciSayi = int.parse(gosterim);
      if(islem == '+'){
        sonuc = (birinciSayi + ikinciSayi).toString();
        gecmis = birinciSayi.toString() + islem.toString() +ikinciSayi.toString();
      }
      if(islem == '-'){
        sonuc = (birinciSayi - ikinciSayi).toString();
        gecmis = birinciSayi.toString() + islem.toString() +ikinciSayi.toString();
      }
      if(islem == 'X'){
        sonuc = (birinciSayi * ikinciSayi).toString();
        gecmis = birinciSayi.toString() + islem.toString() +ikinciSayi.toString();
      }
      if(islem == '/'){
        sonuc = (birinciSayi / ikinciSayi).toString();
        gecmis = birinciSayi.toString() + islem.toString() +ikinciSayi.toString();
      }
    } else {
      sonuc = int.parse(gosterim + btnVal).toString();
    }
    setState(() {
      gosterim = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hesap Makinesi"),
          actions: [
            PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
                itemBuilder: (context){
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: TextButton.icon(     // <-- TextButton
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ikinciSayfa()));
                        },
                        icon: Icon(
                          Icons.plus_one,
                          size: 25.0,
                        ),
                        label: Text('Vize-Final Harf Hesapla'),
                      ),

                    ),
                  ];
                },
                onSelected:(value){
                  if(value == 0){
                    print("My account menu is selected.");
                  }
                }
            ),
          ],
        ),
        backgroundColor: Color(0xFF28527a),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    gecmis,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0x66FFFFFF),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    gosterim,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HesapButton(
                  text: 'AC',
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize:20,
                  callback: btnOnClick,
                ),
                HesapButton(
                  text: 'C',
                  fillColor: 0xFF8ac4d0,
                  textColor:0xFF000000,
                  textSize:24,
                  callback: btnOnClick,
                ),
                HesapButton(
                  text: '<',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize:24,
                  callback: btnOnClick,
                ),
                HesapButton(
                  text: '/',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize:24,
                  callback: btnOnClick,
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapButton(
                    text: '9',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '8',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '7',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: 'X',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapButton(
                    text: '6',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '5',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '4',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '-',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapButton(
                    text: '3',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '2',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '1',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '+',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapButton(
                    text: '+/-',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:22,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '0',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '00',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                  HesapButton(
                    text: '=',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize:24,
                    callback: btnOnClick,
                  ),
                ],
              ),
          ],),
        ),
      )
    );
  }
}
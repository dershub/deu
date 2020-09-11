import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Yanmenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(padding: EdgeInsets.all(20.0), color: Colors.white10, child: Image.asset('assets/tflogo.jpg')),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.domain),
                    title: Text('Bölüm Site Duyuruları'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/duyurular');
                    },
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.blueAccent,
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text('Bölüm Personel Duyuruları'),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Prof. Dr. İbrahim YÜCEDAĞ'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/ibrahimyucedag/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Doç. Dr. Ali ÇALHAN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/alicalhan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. Metin TOZ'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/metintoz/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. Serdar BİROĞUL'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/serdarbirogul/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. Ahmet ALBAYRAK'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/ahmetalbayrak/Profil/Duyurular');
                            //
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. M. Enes BAYRAKDAR'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/muhammedbayrakdar');
                            //
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. Bahar TERCAN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/bahartercan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Dr. Leyla TEKİN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/leylakuru/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Öğr. Gör. Dr. Fadime ÖĞÜLMÜŞ DEMİRCAN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/fadimedemircan/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Dr. Hakan GÜNDÜZ'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/hakangunduz/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Ercan ATAGÜN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/ercanatagun/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Hacer BAYIROĞLU'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/hacerbayiroglu/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Sümeyye BAYRAKDAR'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/sumeyyebayrakdar/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Tuba KARAGÜL YILDIZ'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/tubakaragul/Profil/Duyurular');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Arş. Gör. Tunahan TİMUÇİN'),
                          onTap: () {
                            Navigator.pop(context);
                            _linkac('http://akademik.duzce.edu.tr/tunahantimucin/Profil/Duyurular');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_linkac(String link, {https}) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('Link Açılmıyor!!!');
  }
}

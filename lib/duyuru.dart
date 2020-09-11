import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart'
    as http; //http kütüphanemizi http olarak kullanabilmemiz için kalıtım alıp http olarak tanımladık
import 'package:url_launcher/url_launcher.dart'; //hedef url linkini çalıştırabilmek için url kütüphanemizi import ettik

class Duyuru extends StatefulWidget {
  @override
  _DuyuruState createState() => _DuyuruState();
}

class _DuyuruState extends State<Duyuru> {
  String _htmlveri = '';
  @override
  initState() {
    //initstate metodu istediğimiz fonksiyonu anasayfa açıldığı anda çalıstırmak için kullandığımız bir metoddur.
    super.initState();
    _istek(); //init statet metodu ile istek fonksiyonumuzu kullandık
  }

  Future _istek() async {
    _htmlveri = '';
    setState(() {});
    await http.get('http://bm.tf.duzce.edu.tr/tum-duyurular').then((gelenveri) {
      _htmlveri = gelenveri.body
          .replaceAll('  ', '')
          .replaceAll('\n', '')
          .replaceAll('\t', '')
          .replaceRange(0, 13757, '')
          .replaceRange(6900, 7000, '')
          .replaceAll('Bilgi İşlem Daire Başkanlığı',
              'Abdul Muttalip Arnavut & Mehmet Batuhan Demir');
      debugPrint(gelenveri.toString());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("duyuru"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _istek,
          )
        ],
      ),
      body: Center(
        child: _htmlveri.length > 0
            ? SingleChildScrollView(
                child: Html(
                    data: _htmlveri,
                    onLinkTap: _linkac(
                        "http://bm.tf.duzce.edu.tr/Duyuru/29579/yaz-okulu-sinavlari-hk_")),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

_linkac(String link, {http}) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('Link Açılmıyor!!!');
  }
}

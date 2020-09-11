import 'dart:async'; //Future ve Stream gibi sınıflarla zaman uyumsuz programlama desteği.
import 'dart:io'; //Tarayıcı tabanlı uygulamalar bu kitaplığı kullanamaz.

import 'package:deu/duyurukart.dart'; //duyuru kart dosyamızı kullanabilmek için import ettik
import 'package:deu/yanmenu.dart'; //tasarladığımız yanmenümüzü göstermek için import ettik
import 'package:flutter/material.dart'; //metaryal kütüphanemizi içeri aktardık
import 'package:http/http.dart'
    as http; //http kütüphanemizi http olarak kullanabilmemiz için kalıtım alıp http olarak tanımladık
import 'package:share/share.dart'; //paylaşım yapabilmek için share kütüphanesini import ettik
import 'package:url_launcher/url_launcher.dart'; //hedef url linkini çalıştırabilmek için url kütüphanemizi import ettik

List<String> duyurupler =
    []; //bu liste hedef internet sitesinin duyurularını liste şeklinde sırasıyla alabilmek için string olarak tanımladık
List<String> linkler =
    []; //bu liste hedef internet sitesinin duyurularının linklerini liste şeklinde sırasıyla alabilmek için string olarak tanımladık

class Anasayfa extends StatefulWidget {
  //anasayfa sınıfımızı stateful olarak tanımladık
  Anasayfa({Key key}) : super(key: key); //constructure ı super olarak tanımladık

  @override //anasayfamızı override ettik
  _AnasayfaState createState() => _AnasayfaState();
}

String _htmlveri2 = ''; //gelen verilerimizi bir değişkene aktarmak için global tanımladık

class _AnasayfaState extends State<Anasayfa> {
  @override
  initState() {
    //initstate metodu istediğimiz fonksiyonu anasayfa açıldığı anda çalıstırmak için kullandığımız bir metoddur.
    super.initState();
    istek(); //init statet metodu ile istek fonksiyonumuzu kullandık
  }

  Future istek() async {
//istek fonksiyonumuz sonradan çalışacağı için future olarak tanımladık.

    _htmlveri2 = ''; //_htmlveri2 değişlenimizin içini boş tanımladık null dönmesin diye
    setState(() {}); //yulardaki init state metodu burada çalışmaya başladı.
    await http.get('http://bm.tf.duzce.edu.tr/tum-duyurular').then(
      //hedef url adresinden cevaplar gelene kadar beklettik
      (gelenveri) {
        print(gelenveri.statusCode);
        if (gelenveri.statusCode == 200) {
          _htmlveri2 = gelenveri.body //urlden gelen html verilerinin body kısmını değişkenimizin içine attık
              .replaceAll('\n', ' ') //string düzenlemeleri: altsatıra geçmilen düzensiz boşlukları siler
              .replaceAll('\r', ' ') //string düzenlemeleri: altsatıra geçmilen düzensiz boşlukları siler
              .replaceAll('\t', ' ') //string düzenlemeleri: tabları siler
              .replaceAll('  ', '') //string düzenlemeleri: iki boşlukları siler
              .replaceAll('&', '') //& stringlerini vektiğimiz verinin içinden temizledik
              .replaceAll('uml;', '') //uml ; stringlerini vektiğimiz verinin içinden temizledik
              .replaceAll('nbsp;', ''); //nbsp; stringlerini vektiğimiz verinin içinden temizledik;

          //// Burada sadece duyuruların olduğu alanı alıp sonra sadece oradan işlem yapmak daha mantıklı /////
          RegExp duyurular = RegExp('<ul class="news-items"(.*?)>(.*?)</ul>');
          RegExpMatch regExpMatch = duyurular.firstMatch(_htmlveri2);

          _htmlveri2 = regExpMatch.group(0);

          RegExp duyurularibul = new RegExp(
              '<p>(.*?)</p>'); // çektiğmiz html verilerinin içinde  regexp metodu ile p taglarını arattırdık duyurularibul adlı değişkene aktardık
          Iterable<RegExpMatch> eslestir = duyurularibul.allMatches(
            //çektiğimiz p taglarının arasındaki stringleri liste şeklinde daha kolay bir yöntem olan iterable tanımladık
            _htmlveri2, //ve tüm eşleşen p taglarını _htmlveri2 değişkenimiz içinde arattık
          );
          for (Match m in eslestir) {
            //for döngüsü içinde eşleşen verileri _htmlveri2 değişkenimize grupladık
            duyurupler.add(m.group(1).replaceAll('<p>', '').replaceAll('</p>',
                '')); //duyurupler isminde başta global tanımladığımız string listemizin içine tek tek aktardık ve p taglarını sildirdik
          }
          RegExp linkleribul = new RegExp(
              // çektiğmiz html verilerinin içinde  regexp metodu ile h4 taglarını arattırdık linkleribul adlı değişkene aktardık
              '<a href="http://bm.tf.duzce.edu.tr/Duyuru/(.*?)"target="_self">');
          Iterable<RegExpMatch> linkeslestir = linkleribul.allMatches(
            //çektiğimiz a taglarının arasındaki stringleri liste şeklinde daha kolay bir yöntem olan iterable tanımladık
            _htmlveri2,
          );

          for (Match m1 in linkeslestir) {
            linkler.add(m1.group(1)); //çektiğimiz linkleri linkler listesine tektek aktardık
          }

          setState(() {}); //initstate fonksiyonunu kapattık
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold nesnesi tanımladık
      appBar: AppBar(
          //scaffold nesnesının bir nesnesi olan app bar tanımladık
          toolbarOpacity: 0.5, //opaklığı yarıya düşürdük
          backgroundColor: Colors.blue, //uygulamanun üst bölgesini mavi yaptık
          title: Text(
            //uygulamanın ismi olan başlığımızı attık
            'D.Ü.Bilgisayar Mühendisliği Duyuru',
            style: TextStyle(
              color: Colors.white, //fondun rengi beyaz olarak tanuımladık
              fontWeight: FontWeight.bold, //fondun izelliğini kalın yaptık
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  istek();
                  setState(() {});
                }),
            IconButton(
              onPressed: () {
                Share.share(
                  """D.Ü. Teknoloji Fakültesinin Bilgisayar Mühendisliği Duyuru Mobil Uygulaması.
                   Android:https://play.google.com/store/apps/details?id=com.proje.duyuru&gl=TR
                   İOS:https://apps.apple.com/tr/app/apple-store/id1253964981?l=tr """,
                );
              },
              icon: Icon(Icons.share),
              tooltip: 'Paylaş',
            ),
            IconButton(
              onPressed: () {
                _linkac(Platform.isAndroid
                    ? "market://details?id=com.proje.duyuru&gl=TR"
                    : "itms-apps://apps.apple.com/tr/app/apple-store/id1253964981?l=tr");
              },
              icon: Icon(Icons.star),
              tooltip: 'Puan Ver',
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: duyurupler.length,
          itemBuilder: (BuildContext context, int pozisyon) {
            return DuyuruKart(
              duyurular: duyurupler[pozisyon],
              linkler: linkler[pozisyon],
            );
          },
        ),
      ),
      /* WebView(
        initialUrl: "http://bm.tf.duzce.edu.tr/tum-duyurular",
        onWebViewCreated: (WebViewController webvieW) {
          _controller.complete(webvieW);
        },
      ), */
      /*  Center(
        child: _htmlveri2.length > 0
            ? SingleChildScrollView(
                child: Html(data: _htmlveri2),
              )
            : CircularProgressIndicator(),
      ), */
      /*html veri için*/
      drawer: Yanmenu(),
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

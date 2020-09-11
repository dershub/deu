import 'modeller.dart'; //modeller kütüphanesini import ettik
import 'package:http/http.dart'
    as http; //http kütüphanemizi http olarak kullanabilmemiz için kalıtım alıp http olarak tanımladık

abstract class Islemler {
  List<Duyurumodeli> duyurular;
  Future<bool> istek();
  String veriler;
}

class Islemdetay implements Islemler {
  @override
  List<Duyurumodeli> duyurular = List();

  @override
  String veriler;

  @override
  Future<bool> istek() async {
    veriler = '';
    await http.get('http://bm.tf.duzce.edu.tr/tum-duyurular').then(
      (gelenveri) {
        veriler = gelenveri.body
            .replaceAll('  ', '')
            .replaceAll('\n', '')
            .replaceAll('\t', '')
            .replaceRange(0, 16000, '')
            .replaceRange(4000, 5000, '');
        RegExp duyurularibul = new RegExp('<p>(.*?)"</p>');
        Iterable<RegExpMatch> eslestir = duyurularibul.allMatches(
          veriler,
        );
        for (Match m in eslestir) {
          veriler = m.group(1);
          print(veriler);
        }
      },
    );

    return true;
  }
}

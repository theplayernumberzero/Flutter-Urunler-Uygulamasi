import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';
import 'package:urunler_app/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Urunler>> urunleriYukle() async {
    var urunlerListesi = <Urunler>[];

    var u1 = Urunler(
        urun_id: 1, urun_ad: "Macbook Pro 14", urun_resim: "bilgisayar.png", urun_fiyat: 43000);
    var u2 = Urunler(
        urun_id: 2, urun_ad: "Rayban Club Master", urun_resim: "gozluk.png", urun_fiyat: 2500);
    var u3 = Urunler(
        urun_id: 3, urun_ad: "Sony ZX Series", urun_resim: "kulaklik.png", urun_fiyat: 40000);
    var u4 = Urunler(
        urun_id: 4, urun_ad: "Gio Armani", urun_resim: "parfum.png", urun_fiyat: 2000);
    var u5 = Urunler(
        urun_id: 5, urun_ad: "Casio X Series", urun_resim: "saat.png", urun_fiyat: 8000);
    var u6 = Urunler(
        urun_id: 6, urun_ad: "Dyson V8", urun_resim: "supurge.png", urun_fiyat: 18000);
    var u7 = Urunler(
        urun_id: 7, urun_ad: "IPhone 13", urun_resim: "telefon.png", urun_fiyat: 32000);
    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
      ),
      body: FutureBuilder<List<Urunler>>(
        future: urunleriYukle(),  //deger getirecek
        builder: (context,snapshot){  //snpashot asıl veriyi veren nesne
          if(snapshot.hasData){
            var urunlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: urunlerListesi!.length, //7
              itemBuilder: (context, index){  //sırayla urun listelerini getirecek(0,1,2,3,4,5,6)
                var urun = urunlerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(urun: urun)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(width: 128, height: 128,
                              child: Image.asset("resimler/${urun.urun_resim}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(urun.urun_ad),
                            const SizedBox(height: 10,),
                            Text("${urun.urun_fiyat} ₺" ,style: const TextStyle(fontSize: 20),),
                            const SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                              print("${urun.urun_ad} sepete eklendi");
                            }, child: const Text("Sepete ekle"),)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';

class DetaySayfa extends StatefulWidget {
  Urunler urun;
  DetaySayfa({required this.urun});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun.urun_ad),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.urun.urun_resim}"),
            Text("${widget.urun.urun_fiyat} ₺" ,style: const TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );
  }
}

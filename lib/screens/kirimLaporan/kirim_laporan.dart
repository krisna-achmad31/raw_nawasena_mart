import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/components/landing_page.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/kirimLaporan/provider/kirim_laporan_provider.dart';
import 'package:provider/provider.dart';

import '../../components/text.dart';
import 'component/option_pick_image.dart';

class KirimLaporanScreen extends StatefulWidget {
  static const String routeName = '/kirimLaporanScreen';

  const KirimLaporanScreen({Key? key}) : super(key: key);

  @override
  State<KirimLaporanScreen> createState() => _KirimLaporanScreenState();
}

class _KirimLaporanScreenState extends State<KirimLaporanScreen> {

  Future<bool> popUpBackButton(BuildContext context) async {
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          title: const Text('Exit ?'),
          content: const Text('Do you want to exit when filling out the form ?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: KirimLaporanProvider(),
      child: Consumer<KirimLaporanProvider>(
        builder: (context, kirimLaporanProvider, child){
          return WillPopScope(
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/ic_logo_full.png',
                        color: secondaryColor.withOpacity(0.5),
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: ListView(

                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text(
                                  'Yuk! Membangun Daerah Bersama',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const Text(
                                  'Laporkan permasalahan sekitar kepada Mas Bupati',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'NIK',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'contoh : 350612576572344234',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Nama',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Nama Lengkap',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Nomor Hp',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'contoh : 085746378639',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Laporan',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Laporan anda',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                  maxLines: 8,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Alamat Kejadian',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Alamat Kejadian',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){
                                    kirimLaporanProvider.changeValPick(true);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 185,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: grayText)),
                                    child: kirimLaporanProvider.imageCover != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File('${kirimLaporanProvider.imageCover?.path}'),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.all(52),
                                      child: Image.asset('assets/ic_default_picture.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(onPressed: () async {
                                    Navigator.pushReplacementNamed(context, LandingPageTemplate.routeName);
                                  }, child: Text(
                                      'Laporkan'
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                        kirimLaporanProvider.pick == true ? const OptionPickImage() : Container(),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, left: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: FadeIn(
                              child: Container(
                                width: 90,
                                height: 32,
                                decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(32)),
                                child: Row(children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      "assets/ic_backs.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextRegularExo(
                                    label: 'Go back',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onWillPop: () async => popUpBackButton(context),
          );
        },
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/kirimLaporan/kirim_laporan.dart';

class LaporanScreen extends StatelessWidget {
  static const String routeName = '/laporanScreen';

  const LaporanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor.withOpacity(0.5),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(32)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                TextRegular(
                                  label: 'Halo, mas Bup',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(64)),
                                        child: Center(
                                          child: Padding(padding: EdgeInsets.all(8), child: Icon(Icons.phone)),
                                        ),
                                      ),
                                      Container(
                                        width: 88,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(128),
                                          color: Colors.grey,
                                        ),
                                        child: Icon(Icons.person),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(64)),
                                        child: Center(
                                          child: Padding(padding: EdgeInsets.all(8), child: Icon(Icons.message)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextRegular(
                                  label: 'Call Center Kabupaten Kediri',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextRegular(
                                  label: 'Jl. Soekarno Hatta No.1, Doko, Kec. Ngasem, Kabupaten Kediri, Jawa Timur 64182',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: ListView(
                          children: [
                            // Container(
                            //   width: double.infinity,
                            //   height: 128,
                            //   decoration: BoxDecoration(color: secondaryColor.withOpacity(0.9), borderRadius: BorderRadius.circular(32)),
                            // ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, KirimLaporanScreen.routeName);
                              },
                              child: SizedBox(
                                child: Image.asset('assets/img_laporan_nawasena.png'),
                                width: double.infinity,
                                height: 128,
                              ),
                            ),
                            SizedBox(height: 16,),
                            SizedBox(
                              child: Image.asset('assets/img_pantau_nawasena.png'),
                              width: double.infinity,
                              height: 128,
                            ),
                            SizedBox(height: 16,),
                            SizedBox(
                              child: Image.asset('assets/img_pantau_nawasena.png'),
                              width: double.infinity,
                              height: 128,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 20,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 32, left: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FadeIn(
                        child: Container(
                          width: 90,
                          height: 32,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
                          child: Row(children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                "assets/ic_backs.png",
                                color: primaryColor,
                              ),
                            ),
                            TextRegularExo(
                              label: 'Go back',
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        // body: SafeArea(
        //   child:
        //   ListView(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(height: 16,),
        //             Text(
        //               'NIK',
        //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //             ),
        //             SizedBox(height: 8,),
        //             TextFormField(
        //               decoration: InputDecoration(
        //                   isDense: true,
        //                   hintText: 'contoh : 350612576572344234',
        //                   enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   )),
        //             ),
        //             SizedBox(height: 16,),
        //             Text(
        //               'NIK',
        //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //             ),
        //             SizedBox(height: 8,),
        //             TextFormField(
        //               decoration: InputDecoration(
        //                   isDense: true,
        //                   hintText: 'contoh : 350612576572344234',
        //                   enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   )),
        //             ),
        //             SizedBox(height: 16,),
        //             Text(
        //               'NIK',
        //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //             ),
        //             SizedBox(height: 8,),
        //             TextFormField(
        //               decoration: InputDecoration(
        //                   isDense: true,
        //                   hintText: 'contoh : 350612576572344234',
        //                   enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(width: 1, color: Colors.grey),
        //                     borderRadius: BorderRadius.circular(16),
        //                   )),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}

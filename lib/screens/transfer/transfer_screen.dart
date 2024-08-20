import 'package:flutter/material.dart';
import 'package:nawasena/components/button.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/landing/landing_screen.dart';

import '../../components/header_page.dart';

class TransferScreen extends StatelessWidget {
  static const String routeName = '/transferScreen';

  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8), child: HeaderPage('Konfirmasi Transfer')),
            Column(
              children: [
                SizedBox(
                  height: 84,
                ),
                TextRegular(
                  label: 'Tagihan Anda Sebesar',
                  size: 24,
                ),
                SizedBox(
                  height: 8,
                ),
                TextRegular(
                  label: 'Rp. 6.000.000',
                  size: 24,
                ),
                SizedBox(
                  height: 32,
                ),
                TextRegular(
                  label: 'Silahkan Melakukan Transfer \n Ke Nomor Rekening',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/img_nawasena2.png'),
                          TextRegular(
                            label: '345 54632 87',
                            fontWeight: FontWeight.w600,
                            size: 24,
                          ),
                          Image.asset(
                            'assets/ic_nawasena_copy.png',
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Container(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, LandingScreen.routeName);
            },
            child: TextRegular(
              label: 'Sudah Transfer',
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor
            ),
          ),
        ),
      ),
    );
  }
}

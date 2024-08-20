import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';

class DetailItemScreen extends StatelessWidget {
  static const String routeName = '/detailItemScreen';

  const DetailItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(
          label: 'Detail Item',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 185,
                  child: Image.asset(
                    'assets/img_test_item_nawasena.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRegular(
                    label: 'Kambing Asli Dua Kelinci',
                    fontWeight: FontWeight.bold,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextRegular(
                    label: 'Rp. 6.000.000',
                    size: 20,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: secondaryColor,
                  ),
                  TextRegular(
                    label: 'Description : ',
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextRegular(
                    label:
                        'Di sebuah peternakan yang terletak di pedesaan yang indah, hiduplah seekor kambing yang sangat lucu. Dengan bulu putih yang lembut dan sepasang mata cokelat yang menggemaskan, dia menjadi daya tarik utama di antara hewan-hewan lainnya.Kambing lucu ini memiliki sifat yang ceria dan suka membuat semua orang tersenyum. Setiap kali melihatnya, dia selalu melompat-lompat dengan sukacita yang menular. Dia suka bermain-main dengan anak-anak petani, mengikuti mereka di sekitar peternakan dan menggembirakan hari mereka dengan kelucuannya.Salah satu kebiasaan lucu kambing ini adalah saat dia mencoba berpose seperti model. Ketika ada orang yang mendekatinya dengan kamera, dia akan memiringkan kepalanya ke samping, mengangkat dagunya, dan memancarkan ekspresi lucu yang membuat semua orang terpukau. Tidak ada yang bisa menahan tawa melihatnya berusaha meniru tingkah laku manusia.',
                    size: 16,
                    textAlign: TextAlign.justify,
                    maxLine: 20,
                  ),
                  const SizedBox(height: 64,)
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRegular(
                      label: 'Total Tagihan',
                    ),
                    TextRegular(
                      label: 'Rp 600.000,-',
                      size: 24,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    // var resultTelemetryUnit = await showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true,
                    //   clipBehavior: Clip.hardEdge,
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(defBorderRadius * 2),
                    //       topRight: Radius.circular(defBorderRadius * 2),
                    //     ),
                    //   ),
                    //   builder: (context) {
                    //     return const FormChoosePayment();
                    //   },
                    // );
                    // Navigator.pushNamed(context, TransferScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextRegular(
                        label: 'Add to cart',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

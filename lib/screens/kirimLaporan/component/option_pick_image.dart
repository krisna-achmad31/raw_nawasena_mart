
import 'package:flutter/material.dart';
import 'package:nawasena/screens/kirimLaporan/provider/kirim_laporan_provider.dart';
import 'package:provider/provider.dart';

class OptionPickImage extends StatelessWidget {
  const OptionPickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<KirimLaporanProvider>(
      builder: (context, newPictProv, child){
        return Stack(
          children: [
            InkWell(
              onTap: (){
                newPictProv.changeValPick(false);
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 174,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('Choose Image with'),
                        const SizedBox(height: 32,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                newPictProv.pickImageCoverCamera();
                              },
                              child: Column(
                                children: [
                                  SizedBox(width: 33, height: 33,child: Image.asset('assets/ic_from_camera.png')),
                                  const SizedBox(height: 8,),
                                  const Text('Camera')
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                newPictProv.pickImageCoverGallery();
                              },
                              child: Column(
                                children: [
                                  SizedBox(width: 33, height: 33,child: Image.asset('assets/ic_from_gallery.png')),
                                  const SizedBox(height: 8,),
                                  const Text('Gallery')
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

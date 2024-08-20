
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class KirimLaporanProvider extends ChangeNotifier{

  XFile? _imageCover;
  XFile? get imageCover => _imageCover;

  bool? _pick;
  bool? get pick => _pick;

  changeValPick(bool conditions){
    _pick = conditions;
    notifyListeners();
  }

  pickImageCoverCamera() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickImage == null) return 'Cancel select image cover';

    _imageCover = pickImage;
    notifyListeners();
    _pick = false;
    // if (_imageCover != null) changeValueAddMiniImg();
    notifyListeners();

    return 'Succes add image cover';
  }

  pickImageCoverGallery() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage == null) return 'Cancel select image cover';

    _imageCover = pickImage;
    notifyListeners();
    _pick = false;
    // if (_imageCover != null) changeValueAddMiniImg();
    notifyListeners();

    return 'Succes add image cover';
  }
}
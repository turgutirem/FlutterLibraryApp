import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:library_app/MyHomePage.dart';
import 'dart:io';
import 'package:library_app/model.dart';
import 'package:library_app/servis.dart';

class FormScreen extends StatefulWidget {
  final kitap? book;
  FormScreen({required this.book});
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController kitapAdiController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController kitapTanimiController = TextEditingController();
  TextEditingController kitapTurController = TextEditingController();
  TextEditingController yazarAdiController = TextEditingController();
  TextEditingController kitapId = TextEditingController();
  TextEditingController yazarId = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Eğer widget.book null değilse, ilgili değerleri controller'lara atayın
    if (widget.book != null) {
      kitapAdiController.text = widget.book!.kitap_adi;
      isbnController.text = widget.book!.isbn;
      kitapTanimiController.text = widget.book!.kitap_tanimi;
      kitapTurController.text = widget.book!.kitap_tur;
      yazarAdiController.text = widget.book!.yazar_adi;
      kitapId.text = widget.book!.kitap_id.toString();
      yazarId.text = widget.book!.yazar_id.toString();
    }
  }

  final ImagePicker _imagePicker =
      ImagePicker(); // ImagePicker örneği oluşturun
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: deviceHeight / 6,
          backgroundColor: Colors.transparent, // Arkaplan rengini şeffaf yapın
          elevation: 0, // Gölgelendirmeyi kaldırın
          flexibleSpace: Container(
            height: deviceHeight / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              color: Colors.green[900],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 0,
                  child: Container(
                    height: deviceHeight / 11,
                    width: deviceWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        topLeft: Radius.circular(60),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: Text(
                    "Library App",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          leading: Visibility(
            visible: false, // Butonu görünmez yapar
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 35,
                onPressed: null
                // Geri butonuna basıldığında önceki sayfaya dön

                ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Kitap Ekle",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                            width:
                                8), // İcon ile metin arasında boşluk bırakmak için
                        Text("Sil"),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // İstenilen yuvarlaklık değerini ayarlayın
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: kitapAdiController,
                decoration: InputDecoration(
                  labelText: "Kitap Adı",
                  border:
                      OutlineInputBorder(), // Kutucuk görünümü için border özelliğini ekliyoruz
                  // Kutucuk köşe yuvarlatma
                  // Diğer istediğiniz dekorasyon özelliklerini burada ayarlayabilirsiniz
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: isbnController,
                decoration: InputDecoration(
                  labelText: "ISBN",
                  border:
                      OutlineInputBorder(), // Kutucuk görünümü için border özelliğini ekliyoruz
                  // Kutucuk köşe yuvarlatma
                  // Diğer istediğiniz dekorasyon özelliklerini burada ayarlayabilirsiniz
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: kitapTanimiController,
                decoration: InputDecoration(
                  labelText: "Kitap Tanımı",
                  border:
                      OutlineInputBorder(), // Kutucuk görünümü için border özelliğini ekliyoruz
                  // Kutucuk köşe yuvarlatma
                  // Diğer istediğiniz dekorasyon özelliklerini burada ayarlayabilirsiniz
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: kitapTurController,
                decoration: InputDecoration(
                  labelText: "Kitap Türü",
                  border:
                      OutlineInputBorder(), // Kutucuk görünümü için border özelliğini ekliyoruz
                  // Kutucuk köşe yuvarlatma
                  // Diğer istediğiniz dekorasyon özelliklerini burada ayarlayabilirsiniz
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: yazarAdiController,
                decoration: InputDecoration(
                  labelText: "Yazar Adı",
                  border:
                      OutlineInputBorder(), // Kutucuk görünümü için border özelliğini ekliyoruz
                  // Kutucuk köşe yuvarlatma
                  // Diğer istediğiniz dekorasyon özelliklerini burada ayarlayabilirsiniz
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _pickImage, // Resim seçme işlevselliği
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                            width:
                                8), // İcon ile metin arasında boşluk bırakmak için
                        Text("Kitap Kapağı Seç"),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // İstenilen yuvarlaklık değerini ayarlayın
                      ),
                    ),
                  ),

                  SizedBox(width: 20), // Sağa boşluk bırakmak için
                  ElevatedButton(
                    onPressed: () {
                      bool _areFieldsValid() {
                        return kitapId.text.isNotEmpty &&
                            kitapAdiController.text.isNotEmpty &&
                            isbnController.text.isNotEmpty &&
                            kitapTanimiController.text.isNotEmpty &&
                            kitapTurController.text.isNotEmpty &&
                            yazarAdiController.text.isNotEmpty;
                      }

                      if (_areFieldsValid()) {
                        // Giriş alanları doluysa güncelle fonksiyonunu çağır
                        ApiservisKitap.kitapKaydet(
                            kitapId.text,
                            yazarId.text,
                            kitapAdiController.text,
                            isbnController.text,
                            kitapTanimiController.text,
                            kitapTurController.text,
                            yazarAdiController.text);
                      } else {
                        // Giriş alanları boşsa ekle fonksiyonunu çağır
                        ApiservisKitap.kitapEkle(
                            kitapAdiController.text,
                            isbnController.text,
                            kitapTanimiController.text,
                            kitapTurController.text,
                            yazarAdiController.text);
                      }
                     Navigator.pop(context);
                    
                    },
                    child: Row(
                      children: [
                        Icon(Icons.save_rounded),
                        SizedBox(
                            width:
                                8), // İcon ile metin arasında boşluk bırakmak için
                        Text("Kaydet"),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // İstenilen yuvarlaklık değerini ayarlayın
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: _selectedImage != null
                        ? Image.file(
                            File(_selectedImage!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:library_app/FormScreen.dart';
import 'package:library_app/servis.dart';
import 'model.dart'; // kitap sınıfını içe aktar
//import 'package:http/http.dart' as http; // http paketini ekledik
//import 'dart:convert'; // JSON dönüşümleri için
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<kitap> books = [];

   @override
  void initState() {
    ApiservisKitap.Kitaplistesi().then((value) => setState(() => books = value,));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

   
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormScreen(
                      book: null,
                    )),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[900],
      ),
      appBar: AppBar(
          toolbarHeight: deviceHeight / 5,
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
               /* Positioned(
                  top: 40,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),*/
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                var book = books[index]; // Geçerli kitap verisi
                return Container(
                    height: deviceHeight / 4,
                    child: Stack(children: [
                      Positioned(
                        top: 0,
                        child: Material(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormScreen(
                                      book:
                                          book, // Burada tıklanan kutunun içeriğini geçiyoruz
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                  height: deviceHeight / 5,
                                  width: deviceWidth * 0.95,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: new Offset(-10.0, 10.0),
                                          blurRadius: 20.0,
                                          spreadRadius: 4.0),
                                    ],
                                  ))),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 10,
                          child: Card(
                            elevation: 30.0,
                            shadowColor: Colors.grey.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/mainPage.png'), //burası kitap kapağı olacak!!
                                      fit: BoxFit.fill)),
                            ),
                          )),
                      Positioned(
                        left: 150,
                        top: 0,
                        child: Container(
                            height: deviceHeight / 4,
                            width: deviceWidth * 0.50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.kitap_adi,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  book.yazar_adi,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(book.kitap_adi,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text(book.kitap_tur,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                 Text(book.kitap_tanimi,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      )
                    ]));
              },
            ),
          ),
        ],
      ),
    );
  }
  
}

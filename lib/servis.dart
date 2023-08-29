import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:library_app/MyHomePage.dart';
import 'package:library_app/model.dart';
import 'package:flutter/material.dart';

/*
class ApiservisYazar {
  static Future<List<yazar>> yazarListesi() async {
    var uri = Uri.parse("http://172.16.41.26:44373/api/Kitap/AddOrEdit");

    var data = <Map<String, dynamic>>[];

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        data = List<Map<String, dynamic>>.from(json.decode(response.body));
        print(json.decode(response.body));
      } else {
        print("API hatası: Liste alınamadı");
      }
    } catch (e) {
      print("HTTP isteği sırasında hata oluştu: $e");
    }

    return data.map((map) => yazar.fromJson(map)).toList();
  }
}
*/
String baseUrl = 'http://172.20.10.5:44373/api';
Request request({required String url}){
   var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(url),
      );
      request.headers.addAll(headers);
  return request;  

}
class ApiservisKitap {
  static Future<List<kitap>> Kitaplistesi() async {
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/Kitap/GetAll'));

    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();

    //final response = await http.get(uri);
    var list = [];
    if (response.statusCode == 200) {
      list = json.decode(responseString);
      print(json.decode(responseString));
    } else {
      print("api hatası Liste Alınamadı");
    }

    return list.map((data) => kitap.fromJson(data)).toList();
  }

  static Future<void> kitapKaydet(
      String kitapId,
      String yazarId,
      String kitapAdi,
      String isbn,
      String kitapTanimi,
      String kitapTuru,
      String yazarAdi) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/Kitap/AddOrEdit'),
      );
      request.headers.addAll(headers);

      // JSON verisini doğru bir şekilde oluşturun
      var jsonBody = {
        'kitap_id': kitapId,
        'kitap_adi': kitapAdi,
        'isbn': isbn,
        'kitap_tanimi': kitapTanimi,
        'kitap_tur': kitapTuru,
        'yazar_adi': yazarAdi,
      };

      request.body = json.encode(jsonBody);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Kitap başarıyla kaydedildi.");
      } else {
        print(
            "API hatası - Kitap eklenemedi. Status Code: ${response.statusCode}");
        print("API yanıtı: ${await response.stream.bytesToString()}");
      }
    } catch (error) {
      print("Hata oluştu: $error");
    }
  }

  static Future<void> kitapEkle(
      String kitapAdi,
      String isbn,
      String kitapTanimi,
      String kitapTuru,
      String yazarAdi) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/Kitap/AddOrEdit'),
      );
      request.headers.addAll(headers);

      // JSON verisini doğru bir şekilde oluşturun
      var jsonBody = {
        'kitap_adi': kitapAdi,
        'isbn': isbn,
        'kitap_tanimi': kitapTanimi,
        'kitap_tur': kitapTuru,
        'yazar_adi': yazarAdi,
      };

      request.body = json.encode(jsonBody);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Kitap başarıyla kaydedildi.");
      } else {
        print(
            "API hatası - Kitap eklenemedi. Status Code: ${response.statusCode}");
        print("API yanıtı: ${await response.stream.bytesToString()}");
      }
    } catch (error) {
      print("Hata oluştu: $error");
    }
  }
}



class ApiservisUser {
  static Future<List<kitap>> Kitaplistesi() async {
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/Users/GetAll'));

    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();

    //final response = await http.get(uri);
    var list = [];
    if (response.statusCode == 200) {
      list = json.decode(responseString);
      print(json.decode(responseString));
    } else {
      print("api hatası Liste Alınamadı");
    }

    return list.map((data) => kitap.fromJson(data)).toList();
  }

  static Future<void> UserEkle( 
      String username,
      String email,
      String password,
      String role,) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/Users/Add'),
      );
      request.headers.addAll(headers);

      // JSON verisini doğru bir şekilde oluşturun
      var jsonBody = {
        'username': username,
        'password': password,
        'email': email,
        'role': role,       
      };

      request.body = json.encode(jsonBody);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Kitap başarıyla kaydedildi.");
      } else {
        print(
            "API hatası - Kitap eklenemedi. Status Code: ${response.statusCode}");
        print("API yanıtı: ${await response.stream.bytesToString()}");
      }
    } catch (error) {
      print("Hata oluştu: $error");
    }
  }

  static Future<bool> loginUser(String username, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/Login/User/Login'),
      );
      request.headers.addAll(headers);

      // JSON verisini doğru bir şekilde oluşturun
      var jsonBody = {
        'username': username,
        'password': password,
      };

      request.body = json.encode(jsonBody);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Başarılı giriş.");
        return true;
      
        // Giriş başarılı oldu, istediğiniz işlemleri burada yapabilirsiniz.
      } else {
        print("Giriş yapılamadı. Status Code: ${response.statusCode}");
        print("API yanıtı: ${await response.stream.bytesToString()}");
        return false;
     
      }
    } catch (error) {
      print("Hata oluştu: $error");
      return false;
    }
  }
 
}

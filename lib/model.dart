class yazar {
  final int yazar_id;
  final String yazar_adi;
  
  yazar(
    this.yazar_id,
    this.yazar_adi
 
  );

  yazar.fromJson(Map<String, dynamic> json)
      : yazar_id = json['yazar_id'],
        yazar_adi = json['yazar_adi'];
        
}

class Users{
  final int user_id;
  final String username;
  final String password;
  final String email;
  

  Users(
    this.user_id,
    this.username,
    this.password,
    this.email,
  );

  Users.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        username = json['username'] ?? 0,
        email = json['email']?? '',
        password = json['password']?? '';
        
       
}

class kitap {
  final int kitap_id;
  final int yazar_id;
  final String kitap_adi;
  final String isbn;
  final String kitap_tanimi;
  final String kitap_tur;
  final String yazar_adi;

  kitap(
    this.kitap_id,
    this.yazar_id,
    this.kitap_adi,
    this.isbn,
    this.kitap_tanimi,
    this.kitap_tur,
    this.yazar_adi,
  );

  kitap.fromJson(Map<String, dynamic> json)
      : kitap_id = json['kitap_id'] ?? 0,
        yazar_id = json['yazar_id'] ?? 0,
        kitap_adi = json['kitap_adi']?? '',
        isbn = json['isbn']?? '',
        kitap_tanimi = json['kitap_tanimi'] ?? '',
        kitap_tur = json['kitap_tur'] ?? '',
        yazar_adi = json['yazar_adi'] ?? '';
}
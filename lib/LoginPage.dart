import 'package:flutter/material.dart';
import 'package:library_app/MyHomePage.dart';
import 'package:library_app/servis.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: deviceHeight / 5,
        backgroundColor: Colors.transparent, // Arkaplan rengini şeffaf yapın
        elevation: 0, // Gölgelendirmeyi kaldırın
        flexibleSpace: Container(
          height: deviceHeight / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(80),
            ),
            color: Colors.green[900],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                child: Container(
                  height: deviceHeight / 11,
                  width: deviceWidth * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20), // Sağa boşluk bırakmak için
                ElevatedButton(
                  onPressed: () async {
                    bool loginSuccess = await ApiservisUser.loginUser(
                        _usernameController.text, _passwordController.text);

                    if (loginSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Kullanıcı adı veya şifre yanlış!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Kapat"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 8),
                      Text("Login"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30), // Horizontal padding for the button
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align text to the top-left corner
                    children: [
                      Text("Register:",
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      // Add vertical space between text and button
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.8, // Ekran yüksekliğinin %70'i
                                  padding: EdgeInsets.all(20),
                                  child: RegistrationPage());
                            },
                            isScrollControlled: true,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // Make the button wrap its content
                          children: [
                            Icon(Icons.person_add),
                            SizedBox(width: 8), // Space between icon and text
                            Text("Register"),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart';


class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username= '';
  String password ='';
  bool isLoginSuccess = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Android Developer Group'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Image.network(
                 "https://download.logo.wine/logo/Android_(operating_system)/Android_(operating_system)-Logo.wine.png",
                  height: 200,
                  width: 200,
                ),

                _username(),
                _password(),
                Container(
                  height: 10,
                ),
                _loginbutton(),

              ],
            )));
  }



Widget _username(){
return Container(
  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
  child: TextFormField(
    controller: nameController,
    onChanged: (value){
      username = value;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Username',
    ),
  ),
);
}

Widget _password(){
 return Container(
      padding:EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: TextFormField(
        obscureText: true,
        onChanged: (value){
          password = value;
        },
        controller: passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _loginbutton(){
    return Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: (isLoginSuccess) ? Colors.green :
            Colors.red,
            onPrimary: Colors.white,
          ),
          onPressed: (){
            String text ='';
            if(password =="f"){
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomePage(username: username);}));
            }else{
              setState(() {
                text = "Login Failed";
                isLoginSuccess = false;
              });
            }

            SnackBar snackBar = SnackBar(content: Text(text));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Login'),

        ),
    );
  }
}
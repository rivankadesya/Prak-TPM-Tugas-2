import 'package:flutter/material.dart';
import 'package:tugas2/login_screen.dart';
import 'package:tugas2/setting_page.dart';

class HomePage extends StatefulWidget {
  String username;


  HomePage({Key? key,required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("halaman utama"),
        automaticallyImplyLeading: false,
      ),body:
    Padding(
        padding: EdgeInsets.all(10),
        child:
      ListView(

          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                child: Text(
                  'Selamat datang ${widget.username}',
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontFamily: 'Galano Grotesque',
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Image.network("https://miro.medium.com/max/2400/2*rWxwHpMvG36_MBMo2wEjOw.png"),
            _menu(),
            _logoutbutton(),
          ],
        ),

    ),

    );
  }

  Widget _logoutbutton(){
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

    ElevatedButton(

    onPressed: () {
      String text ='';
      text = "Logout Success";
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return LoginPage();

      }), (route) => false,);
      SnackBar snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: const Text('Logout'),
    ),
    ],
    ),
    );
  }

  Widget _menu(){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _setting(),
        ],
      ),
    );
  }


  Widget _setting(){
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.green,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 100,
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SettingPage();
              }));

            },
          ),
        ),
      ),
    );
  }
}

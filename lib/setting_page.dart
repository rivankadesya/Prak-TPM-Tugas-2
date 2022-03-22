import 'package:flutter/material.dart';
import 'package:tugas2/home_page.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String username = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("setting profil"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Ubah Profil',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                _username(),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _back(),
                      _save(),
                    ],
                  ),
                ),

                Container(
                  height: 10,
                ),
              ],
            )));
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
      child: TextFormField(
        controller: nameController,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'username',
        ),
      ),
    );
  }


  Widget _save(){
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.green,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 50,
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage(username: username);
              }));

            },
          ),
        ),
      ),
    );
  }
  Widget _back(){
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.green,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 50,
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

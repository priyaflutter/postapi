import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:postapi/dataview.dart';
import 'package:postapi/main.dart';
import 'package:postapi/register.dart';

class loginnn extends StatefulWidget {
  const loginnn({Key? key}) : super(key: key);

  @override
  State<loginnn> createState() => _loginnnState();
}

class _loginnnState extends State<loginnn> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    double appbarheight = kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbarheight;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: bodyheight*0.10,),
            Center(
              child: Container(
                height: bodyheight * 0.50,
                width: twidth,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: bodyheight * 0.03)
                ]),
                child: Card(
                  shadowColor: Colors.grey,
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        height: bodyheight * 0.10,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              monostatus = false;
                            });
                          },
                          controller: mono,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelText: "Enter Email Or Mobile No...",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xe1000211), width: 2)),
                              errorText:
                              monostatus ? "Pls fill Details....." : null),
                        ),
                      ),
                      Container(
                        height: bodyheight * 0.10,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              passstatus = false;
                            });
                          },
                          controller: pass,
                          obscureText: show,
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (show == false) {
                                        show = true;
                                      } else {
                                        show = false;
                                      }
                                    });
                                  },
                                  icon: Icon(show
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xe1000211), width: 2),
                              ),
                              labelText: "Enter Password...",
                              errorText:
                                  passstatus ? "Pls fill Details....." : null),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          String phone1 = mono.text;
                          String pass1 = pass.text;

                          if (phone1.isEmpty) {
                            monostatus = true;
                          } else if (pass1.isEmpty) {
                            passstatus = true;
                          } else {
                            print("viewwwwwwwwwwwwwwwww");

                            Response response;
                            var dio = Dio();
                            response = await dio.post(
                                'http://ukin.unitechitsolution.in/ukinbackup/AndroidClass/get_delivery_login.php',
                                data: {'mo_no':phone1, 'password':pass1});
                            print(response);

                              var vv=jsonDecode(response.toString());
                              logindata view=logindata.fromJson(vv);

                              print("=============decord");

                                 print("=============obj");
                                 if(view.success==1)
                                 {
                                   EasyLoading.show(status: "loading...")
                                       .whenComplete(() {
                                     Future.delayed(Duration(seconds: 5))
                                         .then((value) {
                                       Navigator.pushReplacement(context,
                                           MaterialPageRoute(
                                             builder: (context) {
                                               return postdiff();
                                             },
                                           ));

                                       EasyLoading.dismiss();
                                     });
                                   });

                                   // EasyLoading.dismiss();

                                   Future.delayed(Duration(seconds: 4))
                                       .then((value) {
                                     Fluttertoast.showToast(
                                         msg: "Login Sucessfully.....",
                                         toastLength: Toast.LENGTH_SHORT,
                                         gravity: ToastGravity.CENTER,
                                         timeInSecForIosWeb: 1,
                                         backgroundColor: Colors.red,
                                         textColor: Colors.white,
                                         fontSize: 16.0);
                                   });
                                 }
                                 else{

                                   Fluttertoast.showToast(
                                       msg: "Envaid Email-id or Password",
                                       toastLength: Toast.LENGTH_SHORT,
                                       gravity: ToastGravity.CENTER,
                                       timeInSecForIosWeb: 1,
                                       backgroundColor: Colors.blue,
                                       textColor: Colors.black,
                                       fontSize: 16.0);

                                 
                               }
                            String? id = view.id;
                            String? name = view.name;
                            String? mobile = view.mobile;
                            String? mail = view.email;
                            String? password = view.password;


                            splash.pref!.setBool("login", true);
                            
                            splash.pref!.setString("idd", id!);
                            splash.pref!.setString("name", name!);
                            splash.pref!.setString("mobileno", mobile!);
                            splash.pref!.setString("mail", mail!);
                            splash.pref!.setString("password", password!);
                         
                          }

                        },
                        child: Container(
                          height: bodyheight * 0.08,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Center(
                              child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: bodyheight*0.03,bottom: bodyheight*0.03),
                        child: Text(
                          "If you Don't Have Account.....",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: bodyheight * 0.02),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return register();
                            },
                          ));
                        },
                        child: Container(
                          height: bodyheight * 0.08,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xff110113)),
                          child: Center(
                              child: Text(
                                "Create New Account",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  TextEditingController mono = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool monostatus = false;
  bool passstatus = false;

  bool show = false;
}


class logindata {
  int? success;
  String? id;
  String? type;
  String? name;
  String? mobile;
  String? email;
  String? password;
  String? image;
  String? deviceId;
  String? created;

  logindata(
      {this.success,
        this.id,
        this.type,
        this.name,
        this.mobile,
        this.email,
        this.password,
        this.image,
        this.deviceId,
        this.created});

  logindata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
    type = json['type'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    deviceId = json['device_id'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['device_id'] = this.deviceId;
    data['created'] = this.created;
    return data;
  }
}


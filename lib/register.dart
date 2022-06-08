import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:postapi/login.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String img = "";

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;
    double statusbarheight = MediaQuery
        .of(context)
        .padding
        .top;
    double tnaviheight = MediaQuery
        .of(context)
        .padding
        .bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell( onTap: () async {

                  final ImagePicker picker = ImagePicker();
                  final XFile? photo = await picker
                      .pickImage(
                      source: ImageSource.gallery);
                  setState(() {
                    img = photo!.path;
                  });
                  print("========${img}");


                },
                    child: img != ""
                        ? Container(
                      height: bodyheight * 0.30,
                      width: twidth * 0.20,
                      child: CircleAvatar(
                        backgroundImage: FileImage(File(img)),
                        maxRadius: 20,
                      ),
                    )
                        : Container(
                      height: bodyheight * 0.30,
                      width: twidth * 20,
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Icon(
                        Icons.camera,
                        size: bodyheight * 0.15,
                      ),
                    )),
                Container(
                  height: bodyheight * 0.10,
                  width: twidth * 0.90,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          namestatus = false;
                        });
                      },
                      controller: name,
                      decoration: InputDecoration(
                          labelText: "Enter your Name",
                          prefixIcon: Icon(Icons.person),
                          errorText: namestatus ? "Pls fill the Blank" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ))),
                ),
                Container(
                  height: bodyheight * 0.10,
                  width: twidth * 0.90,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          mailstatus = false;
                        });
                      },
                      controller: mail,
                      decoration: InputDecoration(
                          labelText: "Enter your Mail",
                          prefixIcon: Icon(Icons.mail_outline),
                          errorText: mailstatus ? "Pls fill the Blank" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ))),
                ),
                Container(
                  height: bodyheight * 0.10,
                  width: twidth * 0.90,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          mobilestatus = false;
                        });
                      },
                      controller: mobile,
                      decoration: InputDecoration(
                          labelText: "Enter your Mobile Number",
                          prefixIcon: Icon(Icons.phone),
                          errorText: mobilestatus ? "Pls fill the Blank" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ))),
                ),
                Container(
                  height: bodyheight * 0.10,
                  width: twidth * 0.90,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          passwordstatus = false;
                        });
                      },
                      controller: password,
                      decoration: InputDecoration(
                          labelText: "Enter your Password",
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
                              icon: Icon(
                                  show ? Icons.visibility_off : Icons
                                      .visibility)),
                          errorText: passwordstatus ? "Pls fill the Blank" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ))),
                ),
                SizedBox(height: bodyheight * 0.10,),
                ElevatedButton(
                    onPressed: () async {

                      String name1=name.text;
                      String mail1=mail.text;
                      String pass1=password.text;
                      String phone1=mobile.text;

                      if (name1.isEmpty || mail1.isEmpty ||
                          phone1.isEmpty || pass1.isEmpty) {
                       setState(() {
                         namestatus = true;
                         mailstatus = true;
                         mobilestatus = true;
                         passwordstatus = true;
                       });
                      }
                      else {
                        List<int> ii = File(img).readAsBytesSync();
                        String image = base64Encode(ii);

                        Map map = {
                          "name": name1,
                          "mobile": phone1,
                          "email": mail1,
                          "password":pass1,
                          "image": image,
                        };

                          Response response;
                          var dio = Dio();
                          response = await dio.post(
                              'http://ukin.unitechitsolution.in/ukinbackup/AndroidClass/get_delivery_register.php', data:map);

                          var vv=jsonDecode(response.toString());
                            viewdata view=viewdata.fromJson(vv);

                          print(response);

                          if(view.success==2)
                            {
                              Fluttertoast.showToast(
                                  msg: "Registration Sucessfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                            }
                        }

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                            return loginnn();
                      },));

                      } ,

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black)),
                    child: Text(
                      "Submit",
                      style:
                      TextStyle(color: Colors.white, fontSize: bodyheight * 0.03),
                    ))
              ],
            )),
      ),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  bool namestatus = false;
  bool mailstatus = false;
  bool mobilestatus = false;
  bool passwordstatus = false;
  bool show = false;
}


class viewdata {
  int? success;

  viewdata({this.success});

  viewdata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}


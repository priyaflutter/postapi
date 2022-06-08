import 'package:flutter/material.dart';
import 'package:postapi/profirst.dart';
import 'package:postapi/providerclass.dart';

class second extends StatefulWidget {
  List<ProductMultipleImage>? productMultipleImage;

  second(this.productMultipleImage);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double tnaviheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          IconButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                  return pro1();
              },));
          }, icon: Icon(Icons.arrow_back)),
          Text(" ProductMultipleImage"),
        ],
      ),backgroundColor: Colors.black,),
      body: ListView.builder(
        itemCount: widget.productMultipleImage!.length,
        itemBuilder: (context, index) {
      return Container(
        height: bodyheight * 0.30,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Id : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "${widget.productMultipleImage![index].id}",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      );
        },
      ),
    );
  }
}

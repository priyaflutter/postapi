import 'package:flutter/material.dart';
import 'package:postapi/prosecond.dart';
import 'package:postapi/providerclass.dart';
import 'package:provider/provider.dart';

class pro1 extends StatefulWidget {
  const pro1({Key? key}) : super(key: key);

  @override
  State<pro1> createState() => _pro1State();
}

class _pro1State extends State<pro1> {
  final getmyvar provider = getmyvar();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    provider.data();

  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double tnaviheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return ChangeNotifierProvider<getmyvar>(
      create: (context) => provider,
      child: Consumer<getmyvar>(
        builder: (context, provider, child) {
          return Scaffold(
              appBar: AppBar(title: Text("Post API"),backgroundColor: Colors.black,),
              body:provider.status?ListView.builder(
                itemCount: provider.view!.productList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: bodyheight * 0.40,
                    width: double.infinity,
                    padding: EdgeInsets.all(bodyheight*0.01),
                    decoration:
                    BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<getmyvar>(builder: (context, provider, child) =>
                            Row(
                              children: [
                                Container(height: bodyheight*0.10,
                                  width: twidth*0.65,
                                  child:Row(
                                    children: [
                                      Text(
                                        "mainSellingPrice : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "${provider.view!.productList![index].mainSellingPrice}",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      ),
                                    ],
                                  ) ,),
                                Card(color: Colors.grey,
                                  child: Card(
                                    child: Container(
                                      height: bodyheight * 0.10,
                                      width: twidth * 0.20,
                                      margin: EdgeInsets.all(bodyheight*0.01),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${provider.view!.productList![index].image}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                              ],
                            ) ,) ,
                        Consumer<getmyvar>(builder: (context, provider, child) =>
                            Row(
                              children: [
                                Text(
                                  "Unit : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${provider.view!.productList![index].unit}",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                              ],
                            ),),
                        Consumer<getmyvar>(builder: (context, provider, child) =>
                            Row(
                              children: [
                                Text(
                                  "productMultipleImage : ",
                                  style: TextStyle(
                                      fontSize: bodyheight * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                ElevatedButton(
                                  onPressed: () {

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                                      return second(provider.view!.productList![index].productMultipleImage);
                                    },));
                                  },
                                  child: Text(
                                    "Image",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.black)),
                                )
                              ],
                            ),)
                      ],
                    ),
                  );
                },
              ):Center(child: CircularProgressIndicator()),
          );
    },),);
  }
}

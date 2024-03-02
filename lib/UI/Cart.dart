import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hushus/Providers/HomeProvider.dart';
import 'package:hushus/Utils/Colors.dart';
import 'package:provider/provider.dart';

import '../Models/Sandwitch.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Column(
        children: [
          Container(
            height: height * 0.6,
            width: width,
            color: MyColors.darkColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: IconButton(
                          onPressed: ()=> Navigator.pop(context),
                          icon: Icon(Icons.arrow_back,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Cart",
                        style: GoogleFonts.sen(
                            color: Colors.white70,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.fastfood,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                 Container(
                   height: height*0.46,
                   child: ListView.separated(itemBuilder: (BuildContext context ,int index){
                     return  Container(
                       width: width * 0.9,
                       height: height * 0.21,
                       child: Row(
                         children: [
                           Container(
                             height: height * 0.21,
                             width: height * 0.21,
                             decoration: BoxDecoration(
                                 color: Colors.white.withOpacity(0.2),
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(20))),
                             child: Center(
                               child: Image.asset("Assets/sandwitch.png"),
                             ),
                           ),
                           Expanded(
                             child: Padding(
                               padding:  EdgeInsets.only(left: width*0.05),
                               child: Column(
                                 children: [
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         width: width*0.3,
                                         child: Text(
                                           "Sandwitch Hummos",
                                           style: GoogleFonts.sen(
                                               color: Colors.white70,
                                               fontSize: 18,
                                               fontWeight: FontWeight.bold),
                                         ),
                                       ),
                                       Spacer(),
                                       Icon(
                                         Icons.cancel,
                                         color: Colors.red,
                                       ),
                                     ],
                                   ),
                                   Wrap(
                                     spacing: 8.0,
                                     children: context.read<HomeProvider>().cart_order.sandwitch_list[index].ingredents.map((ingredient) {
                                       return buildIngredientChip(ingredient);
                                     }).toList(),
                                   ),
                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                     );
                   }, separatorBuilder: (BuildContext context ,int index){
                     return SizedBox(height: height*0.01,);
                   }, itemCount: context.read<HomeProvider>().cart_order.sandwitch_list.length),
                 )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    children: [
                      Text(
                        "Delivery address",
                        style: GoogleFonts.sen(
                            fontSize: 16, color: Color(0xffA6AABF)),
                      ),
                      Spacer(),
                      Text(
                        "Fees:15 Dzd",
                        style: GoogleFonts.sen(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MyColors.darkColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width,
                    height: height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total:",
                        style: GoogleFonts.sen(
                            fontSize: 16, color: Color(0xffA6AABF)),
                      ),
                      Spacer(),
                      Text(
                        "${context.read<HomeProvider>().cart_order.total} Dzd",
                        style: GoogleFonts.sen(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MyColors.darkColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      // context.read<HomeProvider>().addSandwitchToOrder(
                      //     Sandwitch(sand_id: 'sand_id', ingredents: ingredents_list, price: baseprice+sup, qntt: 1)
                      // );
                      // setState(() {
                      //   badge_order ++ ;
                      // });
                    },
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Color(0xffFF7622),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.sen(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
  Widget buildIngredientChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade300,
      labelStyle: TextStyle(color: Colors.black87),
    );
  }
}

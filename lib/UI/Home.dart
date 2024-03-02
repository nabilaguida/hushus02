import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hushus/Models/Order.dart';
import 'package:hushus/Models/Sandwitch.dart';
import 'package:hushus/Providers/HomeProvider.dart';
import 'package:hushus/Utils/Colors.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int badge_order ;
  @override
  void initState() {
    // TODO: implement initState
    badge_order = HomeProvider().cart_order.sandwitch_list.length ;
    print('cart contains : $badge_order');
    super.initState();
  }
  int selectedCategory = 1;
  List<int> selectedCategories = [];
  int quantity = 1;
  int baseprice = 50;
  int sup = 0;
  List<String> ingredents_list = [];
  String size = "1/2";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          //********************** Header *************************
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.menu),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Column(
                  children: [
                    Text(
                      "Deliver to",
                      style: MyTextStyles().primetext,
                    ),
                    Text(
                      "Nabil Office",
                      style: MyTextStyles().darktext,
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: MyColors.darkColor,
                  child: Badge(
                    label: Text('${badge_order}'),
                    isLabelVisible: badge_order > 0,
                    child: IconButton(
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart())),
                      icon: Icon(Icons.shopping_bag),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //**************************** Hommus *******************
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Container(
              width: width,
              height: height * 0.3,
              child: Stack(
                children: [
                  Positioned(
                      top: height * 0.08,
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xffFFA065),
                                  MyColors.primaryColor,
                                ]),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 60,
                                spreadRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                      )),
                  Container(
                      height: height * 0.3,
                      alignment: Alignment.topCenter,
                      child: Image.asset('Assets/sandwitch.png'))
                ],
              ),
            ),
          ),
          //************************************* placa ************************
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Container(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade400)),
                      child: Center(
                        child: Text(
                          "Hummos Guy 55",
                          style: MyTextStyles().darktext,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Sandwitch Hummos",
                    style: GoogleFonts.sen(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sandwitch Hummos fchbab m 55 tdhrb we t3awd",
                    style:
                        GoogleFonts.sen(fontSize: 16, color: Color(0xffA6AABF)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  //********************** Raiting *****************
                  Container(
                    width: width * 0.6,
                    height: height * 0.06,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: MyColors.primaryColor,
                            size: 30,
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.delivery_dining,
                            color: MyColors.primaryColor,
                            size: 30,
                          ),
                          Text(
                            'Paid',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.watch_later_outlined,
                            color: MyColors.primaryColor,
                            size: 30,
                          ),
                          Text(
                            '20 Min',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  //************************ Size **********************
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  // Container(
                  //   width: width * 0.6,
                  //   height: height * 0.06,
                  //   child: Center(
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           'SIZE:',
                  //           style: TextStyle(
                  //               fontSize: 18, fontWeight: FontWeight.w500),
                  //         ),
                  //         Spacer(),
                  //         buildCategoryChip(1, '1/2',50),
                  //         buildCategoryChip(2, '2/3',80),
                  //         buildCategoryChip(3, '1',100),
                  //         Spacer()
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  //************************* Ingredients
                  Text(
                    'INGRIDENTS:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      ingredients(1, 'Eggs', 35),
                      ingredients(2, 'Cheaze', 20),
                      ingredients(3, 'Extra Kemoun', 0),
                      ingredients(4, 'Zit Zitoun', 0),
                      ingredients(5, 'Mokharwidhat', 0),
                    ],
                  ),

                  //****************** note ******************
                  SizedBox(
                    height: height * 0.01,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "NOTE:",
                        style: GoogleFonts.sen(
                          fontSize: 14,
                          color: Color(0xffFF7622),
                        ),
                        children: [
                          TextSpan(
                            text:
                                " The actual sandwitch is nothing simmilar to this image BUT... it's the best",
                            style: GoogleFonts.sen(
                              fontSize: 14,
                              color: Color(0xffA6AABF),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
          )),
          //*************************** add to cart ********************************
          Container(
            height: height * 0.22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: Color(0xffF0F5FA)),
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    children: [
                      Text(
                        'Snadwitch Price:',
                        style: GoogleFonts.sen(
                            fontSize: 18, color: MyColors.darkColor),
                      ),

                      Spacer(),
                      Text(
                        '${baseprice + sup} Dzd',
                        style: GoogleFonts.sen(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MyColors.darkColor),
                      ),
                      // Container(
                      //   width: width*0.4,
                      //   height: height*0.08,
                      //   padding: EdgeInsets.symmetric(vertical: height*0.01),
                      //   decoration: BoxDecoration(
                      //     color: MyColors.darkColor,
                      //   borderRadius: BorderRadius.all(Radius.circular(60))
                      //   ),
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: width*0.01),
                      //     child: Row(
                      //       children: [
                      //         Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white.withOpacity(0.4)),child: IconButton(onPressed: (){
                      //           if(quantity > 1){
                      //            setState(() {
                      //               quantity -- ;
                      //               total = 50 * quantity + supluments*quantity ;
                      //             });
                      //            print('total = $total');
                      //            print('sup = $supluments');
                      //           }
                      //         }, icon: Text('-',style: TextStyle(color: Colors.white),)))
                      //     ,Spacer(),
                      //         Text('$quantity',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      //         Spacer(),
                      //         Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white.withOpacity(0.4)),child: IconButton(onPressed: (){
                      //           setState(() {
                      //             quantity ++ ;
                      //             total = 50 * quantity + supluments*quantity ;
                      //           });
                      //           print('total = $total');
                      //           print('sup = $supluments');
                      //         }, icon: Text('+',style: TextStyle(color: Colors.white),)))
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<HomeProvider>().addSandwitchToOrder(
                      Sandwitch(sand_id: 'sand_id', ingredents: ingredents_list, price: baseprice+sup, qntt: 1)
                    );
                    setState(() {
                      badge_order ++ ;
                    });
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
                        "Add to Cart",
                        style:
                            GoogleFonts.sen(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryChip(int categoryId, String label, cost) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selectedCategory == categoryId,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedCategory = categoryId;
              size = label ;
              setState(() {
                baseprice = cost;
              });
              print("base = $baseprice");
            }
          });
        },
        selectedColor: MyColors.primaryColor, // Set selected color
        labelStyle: TextStyle(
          color: selectedCategory == categoryId
              ? Colors.white
              : Colors.black, // Set text color
        ),
      ),
    );
  }

  Widget ingredients(int categoryId, String label, int cost) {
    return FilterChip(
      label: Text(label),
      selected: selectedCategories.contains(categoryId),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedCategories.add(categoryId);
            ingredents_list.add(label);
            setState(() {
              sup = sup + cost;
            });
          } else {
            selectedCategories.remove(categoryId);
            ingredents_list.remove(label);
            setState(() {
              sup = sup - cost;
            });
          }
        });
      },

      selectedColor: MyColors.primaryColor, // Set selected color
      labelStyle: TextStyle(
        color: selectedCategories.contains(categoryId)
            ? Colors.white
            : Colors.black, // Set text color
      ),
    );
  }
}

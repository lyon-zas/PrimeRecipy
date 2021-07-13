import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primerecipe/DetailsScreen.dart';
import 'package:primerecipe/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tag = false;
  List freshList = [
    {
      "name": "Chicken Fried Rice",
      "image": "assets/images/chicken_fried_rice.png",
      "description": "So irresistibly delicious",
      "cal": "250 ",
      "cabs": "35",
      "protein": "6"
    },
    {
      "name": "Pasta Bolognese",
      "image": "assets/images/pasta_bolognese.png",
      "description": "True Italian classic with a meaty",
      "cal": "200 ",
      "cabs": "45",
      "protein": "10"
    },
    {
      "name": "Garlic Potatoes",
      "image": "assets/images/filete_con_papas_cambray.png",
      "description": "Crispy Garlic Roasted Potatoe",
      "cal": "150 ",
      "cabs": "30",
      "protein": "8"
    },
    {
      "name": "Asparagus",
      "image": "assets/images/asparagus.png",
      "description": "White Onion, Fennel, and watercress Salad",
      "cal": "190 ",
      "cabs": "35",
      "protein": "12"
    },
    {
      "name": "Filet Mignon",
      "image": "assets/images/steak_bacon.png",
      "description": "Bacon-Wrapped Filet Mignon",
      "cal": "250 ",
      "cabs": "55",
      "protein": "20"
    },
  ];

  List recommmendedList = [
    {
      "name": "Chicken Fried Rice",
      "image": "assets/images/chicken_fried_rice.png",
      "description": "So irresistibly delicious",
      "cal": "250 ",
      "cabs": "35",
      "protein": "6"
    },
    {
      "name": "Pasta Bolognese",
      "image": "assets/images/pasta_bolognese.png",
      "description": "True Italian classic with a meaty",
      "cal": "200 ",
      "cabs": "45",
      "protein": "10"
    },
    {
      "name": "Garlic Potatoes",
      "image": "assets/images/filete_con_papas_cambray.png",
      "description": "Crispy Garlic Roasted Potatoe",
      "cal": "150 ",
      "cabs": "30",
      "protein": "8"
    },
    {
      "name": "Asparagus",
      "image": "assets/images/asparagus.png",
      "description": "White Onion, Fennel, and watercress Salad",
      "cal": "190 ",
      "cabs": "35",
      "protein": "12"
    },
    {
      "name": "Filet Mignon",
      "image": "assets/images/steak_bacon.png",
      "description": "Bacon-Wrapped Filet Mignon",
      "cal": "250 ",
      "cabs": "55",
      "protein": "20"
    },
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print("menu"),
                    child: Image.asset(
                      "assets/icons/menu.png",
                      height: 64.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Notification"),
                    child: Image.asset(
                      "assets/icons/notification.png",
                      height: 54.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.0),
              Text("Welcome Emma",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              SizedBox(
                height: 12.0,
              ),
              Text("What would you like to cook today?",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: "HellixBold",
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(14.0)),
                        child: TextField(
                          cursorColor: kDarkColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 34.0,
                            ),
                            hintText: "search for recipes",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  GestureDetector(
                    onTap: () => print("Filter"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: FaIcon(FontAwesomeIcons.filter,
                          color: Colors.black87, size: 22),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Fresh Recipe",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Fresh Recipes"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: KOrangeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                height: 240.0,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("freshlist")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) { var indexx =  "categories";
                      if (!snapshot.hasData) return _buildLoadingIndicator();
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: freshList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (
                                  context,
                                ) =>
                                        DetailsScreen(
                                          index,
                                          freshList[index]["name"],
                                          freshList[index]["image"],
                                          freshList[index]["cal"],
                                          freshList[index]["cabs"],
                                          freshList[index]["protein"],
                                          freshList[index]
                                              ["description"],
                                          tag = true,
                                        )),
                              ),
                              child: Container(
                                  height: 240.0,
                                  width: 200,
                                  margin: EdgeInsets.only(right: 32.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Positioned(
                                          top: 16.0,
                                          left: 16.0,
                                          child: GestureDetector(
                                              onTap: () =>
                                                  print("color change"),
                                              child: Icon(Icons.favorite_border,
                                                  color: Colors.grey))),
                                      Positioned(
                                          right: -32.0,
                                          top: 16.0,
                                          child: SizedBox(
                                            height: 130,
                                            width: 130,
                                            child: Hero(
                                              tag: "fresh$index",
                                              child: Image.asset(
                                                freshList[index]["image"],
                                              ),
                                            ),
                                          )),
                                      Positioned(
                                        top: 110,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Breakfast",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              SizedBox(height: 8.0),
                                              Container(
                                                width: 180.0,
                                                child: Text(
                                                    freshList[index]["name"],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily:
                                                            "HellixBold")),
                                              ),
                                              SizedBox(height: 8.0),
                                              Row(
                                                children: List.generate(
                                                    5,
                                                    (index) => Icon(
                                                          Icons.star,
                                                          color: KOrangeColor,
                                                          size: 16.0,
                                                        )),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(freshList[index]["cal"],
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: KOrangeColor,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons.access_time,
                                                              color:
                                                                  Colors.grey,
                                                              size: 14.0),
                                                          SizedBox(width: 8.0),
                                                          Text("10 mins",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: Colors
                                                                      .grey)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 32.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/serving.png",
                                                          height: 20.0),
                                                      SizedBox(width: 8.0),
                                                      Text("1 Serving",
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          });
                    }),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Recommended"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: KOrangeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.0),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommmendedList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                index,
                                recommmendedList[index]["name"],
                                recommmendedList[index]["image"],
                                recommmendedList[index]["cal"],
                                recommmendedList[index]["cabs"],
                                recommmendedList[index]["protein"],
                                recommmendedList[index]["description"],
                                tag = false,
                              ))),
                      child: Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          children: [
                            Hero(
                              tag: "recommend$index",
                              child: Image.asset(
                                recommmendedList[index]["image"],
                                height: 180,
                                width: 120.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Breakfast",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 6.0),
                                    Text(recommmendedList[index]["name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: "HellixBold")),
                                    SizedBox(height: 6.0),
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(Icons.star,
                                                color: KOrangeColor,
                                                size: 16.0),
                                          ),
                                        ),
                                        SizedBox(width: 6.0),
                                        Text(recommmendedList[index]["cal"],
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: KOrangeColor,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 6.0),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.access_time,
                                                    color: Colors.grey,
                                                    size: 14.0),
                                                SizedBox(width: 8.0),
                                                Text("10 mins",
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 32.0,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/icons/serving.png",
                                                height: 20.0),
                                            SizedBox(width: 8.0),
                                            Text("1 Serving",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey)),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 28.0,
                                width: 36.0,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }
}

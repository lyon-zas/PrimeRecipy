import 'package:flutter/material.dart';
import 'package:primerecipe/constants.dart';
import 'package:primerecipe/data.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String name, image, cal, cabs, protein, description;
  final bool tags;
  DetailsScreen(this.index, this.name, this.image, this.cal, this.cabs,
      this.protein, this.description, this.tags);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: KOrangeColor,
          icon: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          label: Text(
            "Watch Video",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "HellixBold",
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 64.0, left: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: KOrangeColor,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 28.0),
                    decoration: BoxDecoration(
                        color: KOrangeColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.star, color: kPrimaryColor))),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 36.0, fontFamily: "HellixBold"),
                ),
              ),
              SizedBox(height: 24.0),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "\$",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "HellixBold",
                        color: KOrangeColor)),
                TextSpan(
                    text: "250.25",
                    style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: "HellixBold",
                        color: KOrangeColor))
              ])),
              SizedBox(height: 24.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: widget.cal,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "HellixBold",
                                    color: KOrangeColor)),
                            TextSpan(
                                text: "Kcal",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "HellixBold",
                                    color: KOrangeColor))
                          ])),
                          SizedBox(height: 4.0),
                          Text(
                            "Cabonhydrate",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: widget.cabs,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "HellixBold",
                                    color: KOrangeColor)),
                            TextSpan(
                              text: "g",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "HellixBold",
                                  color: KOrangeColor),
                            ),
                          ])),
                          Text(
                            "Protein",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Container(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: widget.protein,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "HellixBold",
                                      color: KOrangeColor)),
                              TextSpan(
                                text: "g",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "HellixBold",
                                    color: KOrangeColor),
                              ),
                            ])),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "10 mins",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "HellixBold",
                                  color: KOrangeColor
                                )),
                          ]))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Hero(
                        tag: widget.tags
                            ? "{fresh$widget.index}"
                            : "{recommend$widget.index}",
                        child: Image.asset(widget.image,
                            height: 350, fit: BoxFit.contain)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Description",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "HellixBold",
                  )),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, bottom: 28.0),
                child: Text(
                  widget.description,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontFamily: "HellixBold"),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Text("Ingredients",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "HellixBold",
                  )),
              buildTextSubTitleVariation1("2 cups pecans, divided"),
              buildTextSubTitleVariation1(
                  "1 tablespoon unsalted butter, melted"),
              buildTextSubTitleVariation1(
                  "1/4 teaspoon kosher salt, plus more"),
              buildTextSubTitleVariation1("3 tablespoons fresh lemon juice"),
              buildTextSubTitleVariation1("2 tablespoons olive oil"),
              buildTextSubTitleVariation1("1/2 teaspoon honey"),
              SizedBox(
                height: 16,
              ),
              Text("Recipe preparation",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "HellixBold",
                  )),
              buildTextSubTitleVariation1("STEP 1"),
              buildTextSubTitleVariation1(
                  "In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),
              buildTextSubTitleVariation1("STEP 2"),
              buildTextSubTitleVariation1(
                  "In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),
              buildTextSubTitleVariation1("STEP 3"),
              buildTextSubTitleVariation1(
                  "Add the spices with the tomato purée, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),
            ],
          ),
        ),
      ),
    );
  }
}

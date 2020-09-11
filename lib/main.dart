import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';
import 'details_screen.dart';
import 'widgets/category_title.dart';
import 'widgets/food_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            headline6: TextStyle(fontWeight: FontWeight.bold),
            button: TextStyle(fontWeight: FontWeight.bold),
            headline5: TextStyle(fontWeight: FontWeight.bold),
            bodyText1: TextStyle(color: kTextColor),
          )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.26),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  height: 11,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Caminho simples para achar \nComida saborosa",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryTitle(title: "Todos", active: true),
                  CategoryTitle(title: "Italiana"),
                  CategoryTitle(title: "Asiática"),
                  CategoryTitle(title: "Chinesa"),
                  CategoryTitle(title: "Hamburguers"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kBorderColor),
              ),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  FoodCard(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailsScreen();
                        }),
                      );
                    },
                    title: "Tijela de salada vegana",
                    image: "assets/images/image_1.png",
                    price: 20,
                    ingredient: "Tomate vermelho",
                    calories: "420Kcal",
                    description: "Excepteur amet tempor consequat nisi. Anim nostrud nulla ea deserunt id laboris. Occaecat incididunt laborum dolore pariatur officia voluptate officia. Nostrud dolore elit occaecat est elit laboris aute occaecat. Occaecat ex anim incididunt aliqua aliquip. Commodo aute consectetur excepteur officia sit. Elit est officia laboris velit Lorem id ex cupidatat voluptate labore magna cupidatat excepteur."
                  ),
                  FoodCard(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailsScreen();
                        }),
                      );
                    },
                    title: "Tijela de salada vegana",
                    image: "assets/images/image_2.png",
                    price: 20,
                    ingredient: "Tomate vermelho",
                    calories: "420Kcal",
                    description: "Voluptate eiusmod aliquip occaecat quis incididunt ut consectetur reprehenderit. Incididunt quis amet deserunt cupidatat esse eiusmod ea. Aute ea aliquip incididunt commodo eiusmod officia dolore deserunt Lorem incididunt adipisicing laborum magna."                      
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

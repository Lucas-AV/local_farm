import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_farm/farm_page.dart';
import "consts.dart";
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalFarm',
      theme: ThemeData(
        primarySwatch: colorToMaterialColor(Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool darkMode = false;
  int pageIndex = 0;
  Widget logoContainer(){
    return Padding(
      padding: EdgeInsets.only(
          bottom: convHeight(sizes["padding"])
      ),
      child: Container(
        height: convWidth(sizes["logo"]["height"])*.4,
        width: convWidth(sizes["logo"]["width"]),
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RawMaterialButton(
              onPressed: (){},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    "City Neighborhood, 123",
                    style: GoogleFonts.righteous(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down,color: Colors.white)
                ],
              )
          ),
          ],
        ),
      ),
    );
  }

  Widget appBar(){
    List<IconData> iconList = [Icons.home_rounded,Icons.search,Icons.location_on_rounded,Icons.account_circle];
    List<String> imagesName = ["farm","search","locate","profile"];
    Widget buttonBox(int index, String image){
      return GestureDetector(
        onTap: (){
          setState(() {
            pageIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: primaryColor,
            boxShadow: [
              if(index == pageIndex)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0,4)
                ),
            ]
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/$image.png",color: Colors.white),
              // Image.asset("assets/$image.png",color: Colors.white),
            ),
          ),
        ),
      );
    }


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: convWidth(0),vertical: convHeight(0)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: convHeight(sizes['appbar']['height'])+5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 3
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: convWidth(99)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for(int i = 0; i < 2; i++)
                buttonBox(i,imagesName[i]),
              for(int i = 2; i < 4; i++)
                buttonBox(i,imagesName[i]),
            ],
          ),
        ),
      ),
    );
  }
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  Widget searchPage(){
    return Column(
      children: [],
    );
  }

  Widget locatePage(){
    return Column(
      children: [
        logoContainer(),
      ],
    );
  }

  Widget profilePage(){
    return Column(
      children: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: [
                  const FarmPage(),
                  const SizedBox(),
                  locatePage(),
                  profilePage(),
                ][pageIndex],
              ),
            ),
            appBar(),
          ],
        )
      ),
    );
  }
}



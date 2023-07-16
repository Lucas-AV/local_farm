import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({Key? key}) : super(key: key);

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  Widget viewFullListButton(){
    return Padding(
      padding: EdgeInsets.only(
          bottom: convHeight(sizes["padding"])
      ),
      child: RawMaterialButton(
        onPressed: (){},
        constraints: const BoxConstraints(),
        child: Container(
          height: convHeight(sizes["item"]["height"]),
          width: convWidth(sizes["item"]["width"]),
          decoration: BoxDecoration(
            color: primaryOyster,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
              child: Text(
                  "VIEW FULL LIST",
                  style:GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18
                  )
              )
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
  Widget tagList({int count = 5}){
    return Padding(
      padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
      child: SizedBox(
        height: convHeight(sizes["tag"]["height"]),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: convHeight(sizes["tag"]["padding"])),
              child: Container(
                height: convHeight(sizes["#"]["height"]),
                width: convWidth(sizes["#"]["width"]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: primaryColor,
                ),
              ),
            ),
            for(int i = 0; i < count; i++)
              Padding(
                padding: EdgeInsets.only(right: convHeight(sizes["tag"]["padding"])),
                child: Container(
                  height: convHeight(sizes["tag"]["height"]),
                  width: convWidth(sizes["tag"]["width"]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: primaryColor,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
  Widget outdoorList({int count = 5}){
    Widget outdoorItem(){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: convHeight(sizes["outdoor"]["padding"])*0),
        child: RawMaterialButton(
          onPressed: (){},
          child: Container(
            height: convHeight(sizes["outdoor"]["height"]),
            width: convWidth(sizes["outdoor"]["width"]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
      child: SizedBox(
        height: convHeight(sizes["outdoor"]["height"]),
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: count,
          itemBuilder: (context, index, item){
            return outdoorItem();
          },
          options: CarouselOptions(
            aspectRatio: 16/9,
            enableInfiniteScroll: true,
            viewportFraction: 0.735,
          ),
        ),
      ),
    );
  }
  Widget divisor(){
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: convHeight(sizes["padding"])
      ),
      child: Container(
        height: convHeight(sizes["divisor"]["height"]),
        width: convWidth(sizes["divisor"]["width"]),
        decoration: BoxDecoration(
            color: secondaryColor
        ),
      ),
    );
  }

  Widget itemColumn(){
    Widget item(){
      return Padding(
        padding: EdgeInsets.only(
            bottom: convHeight(sizes["padding"])
        ),
        child: Container(
          height: convHeight(sizes["item"]["height"]),
          width: convWidth(sizes["item"]["width"]),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryBlack,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(radius)),
                ),
                height: convHeight(sizes["img-item"]["height"]),
                width: convWidth(sizes["img-item"]["width"]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: convWidth(69),vertical: convHeight(42)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      );
    }


    return Column(
      children: [
        divisor(),
        // Text
        Padding(
            padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
            child: Text("LAST VIEWED ITEMS",style: GoogleFonts.montserrat(fontSize: 18,color: secondaryColor))
        ),

        // Item
        for(int i = 0; i < 3; i++)
          item(),
        viewFullListButton(),
      ],
    );
  }
  Widget producerColumn(){
    Widget item(){
      return Padding(
        padding: EdgeInsets.only(
            bottom: convHeight(sizes["padding"])
        ),
        child: Container(
          height: convHeight(sizes["producer"]["height"]),
          width: convWidth(sizes["producer"]["width"]),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: convHeight(84),
                        decoration: BoxDecoration(
                            color: secondaryGreen,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(9))
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryBlack,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(radius)),
                ),
                width: convWidth(sizes["img-item"]["width"]),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        divisor(),
        // Text
        Padding(
            padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
            child: Text(
                "LAST VIEWED PRODUCERS",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: secondaryColor
                )
            )
        ),

        // Item
        for(int i = 0; i < 3; i++)
          item(),
        viewFullListButton(),
      ],
    );
  }
  Widget logoContainer(){
    return Padding(
      padding: EdgeInsets.only(
        bottom: convHeight(sizes["padding"])
      ),
      child: Container(
        height: convWidth(sizes["logo"]["height"]),
        width: convWidth(sizes["logo"]["width"]),
        color: primaryColor,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        logoContainer(),

        // Tag
        tagList(),

        // Outdoor
        outdoorList(),

        // Last Viewed Item
        itemColumn(),

        // Last Viewed Item
        producerColumn(),

        SizedBox(
          height: convHeight(sizes['appbar']['height'])+5,
          width: double.infinity,
        ),
      ],
    );
  }
}

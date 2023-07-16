import 'package:local_farm/divisor_widget.dart';
import 'package:local_farm/logo_widget.dart';
import 'package:local_farm/outdoor_widget.dart';
import 'package:local_farm/product_widget.dart';
import 'package:local_farm/tag_widget.dart';

import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'producer_widget.dart';

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
                fontSize: 18,
                fontWeight: FontWeight.w500
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

  Widget productColumn(){
    return Column(
      children: [
        const DivisorWidget(title: "LAST VIEWED ITEMS"),

        // Item
        for(int i = 0; i < 3; i++)
          ProductWidget(product: products[i]),
        viewFullListButton(),
      ],
    );
  }
  Widget producerColumn(){
    return Column(
      children: [
        const DivisorWidget(title: "LAST VIEWED PRODUCERS",),

        // Item
        for(int i = 0; i < 3; i++)
          const ProducerWidget(),
        viewFullListButton(),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        LogoWidget()
        ..height = 424,

        // Tag
        TagList(tags: exampleTags),

        // Outdoor
        const OutdoorList(),

        // Last Viewed Item
        productColumn(),

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

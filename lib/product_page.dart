import 'package:flutter/material.dart';
import 'package:local_farm/divisor_widget.dart';
import 'package:local_farm/logo_widget.dart';
import 'package:local_farm/tag_widget.dart';
import 'consts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'producer_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  Widget nutritionSection(){
    Widget nutritionWidget(String title, String value, double multi){
      return Padding(
          padding: EdgeInsets.only(bottom: convHeight(44)),
          child: Container(
            height: convHeight(120),
            width: convWidth(1030),
            decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1
                  )
                ],
                borderRadius: BorderRadius.circular(radius)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: convWidth(44)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context,constraints){
                        return Text(
                          title,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: constraints.maxWidth*0.14
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: convWidth(38)),
                          child: Text(
                            value,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: convWidth(360),
                              height: convHeight(36),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 0.5
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Container(
                              width: convWidth(360*multi),
                              height: convHeight(36),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
    }


    return Column(
      children: [
        const DivisorWidget(title: "NUTRITIONAL INFORMATION"),
        Padding(
          padding: EdgeInsets.only(bottom: convHeight(42)),
          child: Container(
            width: convWidth(1154),
            height: convHeight(835),
            decoration: BoxDecoration(
              border: Border.all(
                color: secondaryColor,
                width: 4,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: convWidth(35),
                vertical: convHeight(50),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    nutritionWidget("Sodium","0.5g - 0.15%",0.15),
                    nutritionWidget("Sugar","12g - 10%",.10),
                    nutritionWidget("Saturated Fat","11g - 8%",.33),
                    nutritionWidget("Trans Fat","5g - 5%",0.19),
                    nutritionWidget("Protein","45g - 26%",0.5),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget producerSection(){
    return Column(
      children: [
        const DivisorWidget(
          title: "LOCAL PRODUCERS",
        ),
        for(int i = 0; i < 10; i++)
          const ProducerWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LogoWidget()
              ..color = primaryBlack
              ..child = Padding(
                padding: EdgeInsets.only(
                    left: convWidth(85),
                    top: convHeight(94),
                    bottom: convHeight(60)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/back.png")
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              TagList(tags: exampleTags),
              nutritionSection(),
              producerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
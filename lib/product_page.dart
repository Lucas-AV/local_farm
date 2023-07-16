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
    return Column(
      children: const [
        DivisorWidget(title: "NUTRITIONAL INFORMATION\nPORTION OF 100g"),
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
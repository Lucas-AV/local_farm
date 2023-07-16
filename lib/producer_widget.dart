import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';

class Producer {
  String name;
  String place;
  List<String> tags;
  List<Product> products;
  Producer(this.name,this.place,this.tags,this.products);
}

class ProducerWidget extends StatefulWidget {
  const ProducerWidget({Key? key}) : super(key: key);

  @override
  State<ProducerWidget> createState() => _ProducerWidgetState();
}

class _ProducerWidgetState extends State<ProducerWidget> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }

  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: convHeight(sizes["padding"])
      ),
      child: RawMaterialButton(
        constraints: const BoxConstraints(),
        onPressed: (){},
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
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: convWidth(64)),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    producerExample.place,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    producerExample.name,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    Container(
                        width: double.infinity,
                        height: convHeight(84),
                        decoration: BoxDecoration(
                            color: secondaryGreen,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(9))
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: convWidth(64),
                              right: convWidth(144)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for(int i = 0; i < 4; i++)
                                Text("Tag ${i+1}",
                                    style: GoogleFonts.montserrat(
                                        color: secondaryColor,
                                        fontSize: 12
                                    )
                                ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: primaryBlack,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(radius)),
                ),
                width: convWidth(sizes["img-item"]["width"]),
                child: const Center(
                    child: Text(
                        "img-item",
                        style: TextStyle(
                            color: Colors.white
                        )
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'consts.dart';
import 'package:google_fonts/google_fonts.dart';

class DivisorWidget extends StatefulWidget {
  const DivisorWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<DivisorWidget> createState() => _DivisorWidgetState();
}

class _DivisorWidgetState extends State<DivisorWidget> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
        ),
        Padding(
            padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
            child: Text(widget.title,textAlign: TextAlign.center,style: GoogleFonts.montserrat(fontSize: 18,color: secondaryColor))
        ),
      ],
    );
  }
}

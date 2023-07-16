import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OutdoorWidget extends StatefulWidget {
  OutdoorWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  String mode = "outdoor";
  @override
  State<OutdoorWidget> createState() => _OutdoorWidgetState();
}

class _OutdoorWidgetState extends State<OutdoorWidget> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.mode == "outdoor"? 0 : convHeight(sizes["padding"])),
      child: RawMaterialButton(
        onPressed: (){},
        child: Container(
          height: convHeight(sizes[widget.mode]["height"]),
          width: convWidth(sizes[widget.mode]["width"]),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: convWidth(62),bottom: convHeight(45)),
                child: Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OutdoorList extends StatefulWidget {
  const OutdoorList({Key? key}) : super(key: key);

  @override
  State<OutdoorList> createState() => _OutdoorListState();
}

class _OutdoorListState extends State<OutdoorList> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
      child: SizedBox(
        height: convHeight(sizes["outdoor"]["height"]),
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: categories.length,
          itemBuilder: (context, index, item){
            return OutdoorWidget(title: categories[index]);
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
}

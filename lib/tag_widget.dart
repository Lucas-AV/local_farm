import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';

class TagWidget extends StatefulWidget {
  const TagWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.text == "#"?
      EdgeInsets.symmetric(horizontal: convHeight(sizes["tag"]["padding"])) :
      EdgeInsets.only(right: convHeight(sizes["tag"]["padding"])),
      child: Container(
        height: widget.text == "#"? convHeight(sizes["#"]["height"]) : convHeight(sizes["tag"]["height"]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: primaryColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: convWidth(widget.text == "#"? 44:72)
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: widget.text == "#"? 22 : 18,
              fontWeight: FontWeight.w500
            )
          ),
        ),
      ),
    );
  }
}

class TagList extends StatefulWidget {
  const TagList({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;
  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
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
        height: convHeight(sizes["tag"]["height"]),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const TagWidget(text: "#"),
            for(String i in widget.tags)
              TagWidget(text: i),
          ],
        ),
      ),
    );
  }
}


import 'package:local_farm/logo_widget.dart';
import 'package:local_farm/outdoor_widget.dart';
import 'package:local_farm/product_widget.dart';
import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  bool searchComplete = false;
  String result = "";

  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }


  Widget categoryColumn(){
    return Column(
      children: [
        for(String i in categories)
          OutdoorWidget(title: i)
          ..mode = "categoryCard"
      ],
    );
  }

  Widget suggestColumn(){
    Widget suggestCard(int index){
      String suggest = products[index].name;
      return GestureDetector(
        onTap: (){
          setState(() {
            result = suggest;
            textEditingController.text = suggest;
            searchComplete = true;
          });
        },
        child: Container(
          width: convWidth(1328),
          height: convHeight(153),
          decoration: BoxDecoration(
            color: index % 2 != 0? thirdColor:primaryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(index == 0? 10:0),
              bottom: Radius.circular(index == products.length-1? 10:0),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: convWidth(120)),
                child: Text(
                  suggest,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: [
        for(int i = 0; i < products.length; i++)
          suggestCard(i),
        SizedBox(
          height: convHeight(44),
        )
      ],
    );
  }

  Widget searchField(){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: result.isEmpty? backgroundColor:quadGreen,
      child: TextFormField(
        controller: textEditingController,
        onChanged: (value){
          setState(() {
            result = value;
          });
        },
        onEditingComplete: (){
          setState(() {
            searchComplete = true;
          });
        },
        onFieldSubmitted: (e){
          setState(() {
            searchComplete = true;
          });
        },
        onTap: (){
          setState(() {
            searchComplete = false;
          });
        },
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor,width: convWidth(5)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor,width: convWidth(5)),
            ),
            hintText: "Search",
            prefix: SizedBox(width: convWidth(116)),
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: primaryOyster
            ),
            suffix: Padding(
              padding: EdgeInsets.only(right: convWidth(36)),
              child: GestureDetector(
                  onTap: (){
                    setState(() {
                      textEditingController.text = "";
                      result = "";
                      searchComplete = false;
                    });
                  },
                  child: Icon(Icons.clear,color: primaryOyster)
              ),
            )
        ),
        style: GoogleFonts.montserrat(
          color: secondaryColor,
        ),
        cursorColor: primaryColor,
        cursorWidth: 2,
      ),
    );
  }

  Product find(String input){
    for(Product i in products){
      if(i.name == input){
        return i;
      }
    }
    return products[0];
  }

  Widget itemColumn(){
    return Column(
      children: [
        for(int i = 0; i < 20; i++)
          ProductWidget(product: find(result)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: convHeight(20)),
          child: LogoWidget()
          ..child = Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: convWidth(61)),
                child: searchField(),
              ),
            ],
          )
          ..color = backgroundColor
          ..height = 424,
        ),
        result.isEmpty? categoryColumn():
        searchComplete? itemColumn():
        suggestColumn(),
        SizedBox(
          height: convHeight(sizes['appbar']['height'])+5,
          width: double.infinity,
        ),
      ],
    );
  }
}

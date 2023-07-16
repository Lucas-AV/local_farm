import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }
  Widget logoContainer({Widget child = const SizedBox(),double height = 611,double multi = 1, Color color = const Color(0xff72986F)}){
    return Padding(
      padding: EdgeInsets.only(
        bottom: convHeight(sizes["padding"]),
      ),
      child: Container(
        height: convWidth(height)*multi,
        width: convWidth(sizes["logo"]["width"]),
        color: color,
        child: child,
      ),
    );
  }

  bool searchComplete = false;
  String result = "";
  TextEditingController textEditingController = TextEditingController();
  List<String> suggests = [
    "Shimeji Mushrooms",
    "Red Neck Chicken",
    "Fresh tomatoes",
    "Blueberry Jam",
    "Pomegranate",
  ];
  Widget categoryCard(){
    return Padding(
      padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
      child: Container(
        width: convWidth(sizes["categoryCard"]["width"]),
        height: convWidth(sizes["categoryCard"]["height"]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: primaryColor,
        ),
      ),
    );
  }

  Widget categoryColumn(){
    return Column(
      children: [
        for(int i = 0; i < 5; i++)
          categoryCard(),
      ],
    );
  }

  Widget suggestCard(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          result = suggests[index];
          textEditingController.text = suggests[index];
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
            bottom: Radius.circular(index == suggests.length-1? 10:0),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: convWidth(120)),
              child: Text(
                suggests[index],
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

  Widget suggestColumn(){
    return Column(
      children: [
        for(int i = 0; i < suggests.length; i++)
          suggestCard(i),
      ],
    );
  }

  Widget searchField(){
    return TextFormField(
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
    );
  }

  Widget item(){
    return Padding(
      padding: EdgeInsets.only(
          bottom: convHeight(sizes["padding"])
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemPage()));
        },
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
      ),
    );
  }

  Widget itemColumn(){
    return Column(
      children: [
        for(int i = 0; i < 20; i++)
          item(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: convHeight(20)),
          child: logoContainer(
              height: 424,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: convWidth(61)),
                    child: searchField(),
                  ),
                ],
              )
          ),
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


class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }
  Widget logoContainer({Widget child = const SizedBox(),double height = 611,double multi = 1, Color color = const Color(0xff72986F)}){
    return Padding(
      padding: EdgeInsets.only(
        bottom: convHeight(sizes["padding"]),
      ),
      child: Container(
        height: convWidth(height)*multi,
        width: convWidth(sizes["logo"]["width"]),
        color: color,
        child: child,
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

  Widget nutritionSection(){
    return Column(
      children: [
        divisor(),
        Padding(
            padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
            child: Text("NUTRITIONAL INFORMATION",style: GoogleFonts.montserrat(fontSize: 18,color: secondaryColor))
        ),
      ],
    );
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              logoContainer(
                color: primaryBlack,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: convWidth(85),top: convHeight(94)),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/back.png")
                        )
                      ),
                    )
                  ],
                )
              ),
              tagList(),
              nutritionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

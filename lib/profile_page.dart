import 'package:flutter/material.dart';
import 'consts.dart';
import 'package:google_fonts/google_fonts.dart';

class User{
  String name;
  String password;
  String email;
  String phone;
  String bio;
  List<String> foodRestriction = [
    "Restriction 1",
    "Restriction 2",
    "Restriction 3",
    "Restriction 4",
    "Restriction 5",
    "Restriction 6",
  ];
  User(this.name,this.password,this.email,this.phone,this.bio);
}

User templateUser = User(
  "Fulano de Tales Males Bragales",
  "Passaword",
  "tales.fulano@mail.com",
  "+00 000 00000-0000",
  "Bio",
);

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();

  double convHeight(double height){
    return MediaQuery.of(context).size.height*(height/axisHeight);
  }
  double convWidth(double width){
    return MediaQuery.of(context).size.width*(width/axisWidth);
  }

  Widget profileButton(String text){
    return Container(
      height: convHeight(155),
      width: convWidth(659),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14
          ),
        ),
      ),
    );
  }



  Widget fieldColumn(String title, Color background, {int maxLines = 1}){
    TextEditingController textEditingController = TextEditingController();
    Map<String,dynamic> field = {
      "Name":templateUser.name,
      "Email":templateUser.email,
      "Phone":templateUser.phone,
      "Bio":templateUser.bio,
      "Password":templateUser.password,
      "Food Restriction":"",
    };
    textEditingController.text = field[title];
    return Padding(
      padding: EdgeInsets.only(bottom: convHeight(sizes["padding"])),
      child: SizedBox(
        width: convWidth(1325),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: convHeight(30)),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: convWidth(1325),
              height: convHeight(
                  title == "Food Restriction"?200:180
              )*maxLines,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0,3)
                  )
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: convWidth(title == "Food Restriction"? 29:42)),
                  child: title == "Food Restriction"? Row(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(String i in templateUser.foodRestriction)
                              Padding(
                                padding: EdgeInsets.only(right: convWidth(42)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: convWidth(400),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffBFDCBA),
                                      borderRadius: BorderRadius.circular(radius),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 3,
                                        )
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              i,
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.close_rounded,color: Colors.black,size: 16)
                                        ],
                                      ),
                                    )
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 35,
                          color: secondaryColor,
                          child: const Icon(Icons.add,color: Colors.white),
                        ),
                      )
                    ],
                  ) :
                  title == "Password"? Center(
                    child: Text(
                      "Change Password",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18
                      ),
                    )
                  ) :
                  TextFormField(
                    maxLines: maxLines,
                    controller: textEditingController,
                    style: GoogleFonts.montserrat(
                      color: background == secondaryColor? Colors.white:secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    cursorColor: background == secondaryColor? Colors.white:primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: convHeight(sizes["padding"])+2,
              right: convWidth(58),
              left: convWidth(58),
              bottom: convHeight(73),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: convHeight(700),
                  width: convWidth(700),
                  decoration: BoxDecoration(
                    color: primaryBlack,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ],
            ),
          ),
          fieldColumn(
            "Name",
            quadGreen
          ),
          fieldColumn(
            "Email",
            quadGreen
          ),
          fieldColumn(
            "Phone",
            secondaryColor,
          ),
          fieldColumn(
            "Bio",
            secondaryColor,
            maxLines: 3
          ),
          fieldColumn(
            "Food Restriction",
            secondaryColor,
            maxLines: 1
          ),

          fieldColumn(
            "Password",
            primaryColor,
            maxLines: 1
          ),
          SizedBox(
            height: convHeight(sizes["appbar"]["height"])+5,
          )
        ],
      ),
    );
  }
}

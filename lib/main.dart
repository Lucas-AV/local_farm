import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalFarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Category {
  String image;
  String name;

  Category(this.name,this.image);
}

class _HomePageState extends State<HomePage> {

  Widget appRowBar(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8,top: 4),
            child: SizedBox(width: 24),
          ),
          RawMaterialButton(
              onPressed: (){},
              child: Row(
                children: [
                  const SizedBox(width: 24),
                  Text(
                    "City Neighborhood, 123",
                    style: GoogleFonts.righteous(
                      fontSize: 16,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down,color: Colors.green)
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8,top: 0),
            child: GestureDetector(child: const Icon(Icons.notifications_none_rounded)),
          ),
        ],
      );
  }

  Widget columnRowCategory(){
    List<Category> categories = [
      Category("Grãos e Cereais", ""),
      Category("Derivados de Leite", ""),
      Category("Ervas e Temperos", ""),
      Category("Bebidas artesanais", ""),
      Category("Frutas e Vegetais", ""),
      Category("", ""),
      Category("", ""),
      Category("", ""),

    ];
    Color fontColor = Colors.black;
    Color backgroundColor = Colors.white;
    TextStyle style = GoogleFonts.righteous(
      color: fontColor.withOpacity(0.5),
      shadows: [
        const Shadow(
          color: Colors.black,
          blurRadius: 1
        )
      ]
    );

    Widget categoryButton(Category category){
      return RawMaterialButton(
        constraints: const BoxConstraints(),
        onPressed: (){},
        child: Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow:  [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0,5),
              ),
              BoxShadow(
                color: backgroundColor,
                blurRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(category.name,style: style,textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          for(int r = 0; r < 2; r++)
            Padding(
              padding: EdgeInsets.only(top: r != 0? 12:6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for(int i = 0; i < 4; i++)
                    categoryButton(categories[i+(4*r)])
                ],
              ),
            ),
        ],
      )
    );
  }

  BottomNavigationBar bottomNavigationBar(){
    Color bottomNavBarButtonColor = Colors.black;
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: bottomNavBarButtonColor),
            activeIcon: Icon(Icons.home_rounded,color: bottomNavBarButtonColor),
            label: "Início"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,color: bottomNavBarButtonColor),
          activeIcon: Icon(Icons.home_rounded,color: bottomNavBarButtonColor),
          label: "Busca",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "asd"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "asd"
        ),
      ],
    );
  }

  Widget outdoorListView(){
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 100; i++)
            Container(
              height: 150,
              width: 150,
              color: i % 2 == 0? Colors.red:Colors.white,
            )
        ],
      ),
    );
  }

  Widget searchButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RawMaterialButton(
        constraints: const BoxConstraints(),
        onPressed: (){},
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  offset: Offset(0,3)
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset('assets/search.png')
                  )
              ),
              const Expanded(
                child: SizedBox(),
                // TextField(
                //   decoration: const InputDecoration(
                //     border: InputBorder.none,
                //   ),
                //   cursorWidth: 2,
                //   style: GoogleFonts.righteous(),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: Icon(MdiIcons.microphone),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              appRowBar(),
              columnRowCategory(),
              const SizedBox(height: 12),
              searchButton(),
            ],
          ),
        ),
      ),
    );
  }
}


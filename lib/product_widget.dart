import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';
import 'product_page.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(
            product: widget.product,
          )));
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
                child: const Center(
                    child: Text(
                        "img-item",
                        style: TextStyle(
                            color: Colors.white
                        )
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: convWidth(55),vertical: convHeight(42)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.product.name,
                      style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'consts.dart';

class LogoWidget extends StatefulWidget {
  LogoWidget({Key? key}) : super(key: key);
  Color color = const Color(0xff72986F);
  Widget child = Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: Image.asset("assets/logo.png"),
  );
  double height = 611;
  double multi = 1;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
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
        bottom: convHeight(sizes["padding"]),
      ),
      child: Container(
        height: convWidth(widget.height)*widget.multi,
        width: convWidth(sizes["logo"]["width"]),
        color: widget.color,
        child: widget.child,
      ),
    );
  }
}

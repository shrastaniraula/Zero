import 'package:flutter/material.dart';
import 'package:zero/Global/colors.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [HexColor("#36C0FD"), HexColor("#007CFD")],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.6),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 6, bottom: 6),
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${(20)}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w300,
                    fontSize: MediaQuery.sizeOf(context).height * 0.03,
                    color: AppTheme.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cloud_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      'Mostly Cloudy',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Precipitation: ${(20)}%',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w300,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                    color: AppTheme.white,
                  ),
                ),
                Text(
                  'Wind: ${(3)} mph',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w300,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sizer/sizer.dart';

import 'package:my_weather_app/data/weather_data.dart';
import 'package:my_weather_app/helper/constants.dart';
import 'package:my_weather_app/model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dataisloded = false;

  @override
  void didChangeDependencies() {
 
    if (dataisloded == false) {
      final data = Provider.of<Weatherdata>(context);
      data.getdata();
      dataisloded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //late Weather myweather   ;
    // myweather = data.getdata() as Weather;
    final data = Provider.of<Weatherdata>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const ImageIcon(AssetImage(options)),
        actions: [
          SizedBox(
            height: 5.h,
            width:  10.w,
            child: SvgPicture.asset(user))
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  '${data.w2.cityname},Morocco',
                  style: TextStyle(color: Colors.white, fontSize: 19.sp),
                ),
                Text(
                  'Today',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(

                    //color: Colors.white,
                    height: 25.h,
                    width: 55.w,
                    child: SimpleShadow(
                        color: Colors.black.withAlpha(200),
                        offset: const Offset(0, 15),
                        opacity: 0.3,
                        child: Image.asset(sun_and_cloud))),
                Text(
                  data.w2.description,
                  style: TextStyle(
                      color: Colors.white.withAlpha(150),
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                     TodayWeathedata(title: 'Temp',value: '${data.w2.temp}c',),
                     TodayWeathedata(title: 'Wind Speed',value: '${data.w2.windspedd}Km/h',),
                     TodayWeathedata(title: 'Humidity',value: '${data.w2.humidity}%',),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3.h,vertical: 1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                       Text('Today',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp
                      ),),
                      Container(
                        //height: 5.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                             borderRadius: BorderRadius.circular(50),
                        ),
                       
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('View Full Report',style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: backgroundColor

                          ),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class TodayWeathedata extends StatelessWidget {
  const TodayWeathedata({
    this.title,this.value
  }) ;
  final String? title;
  final String? value;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: Colors.white),
        ),
        Text(
          value!,
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize:10.sp,
              color: Colors.white),
        )
      ],
    );
  }
}
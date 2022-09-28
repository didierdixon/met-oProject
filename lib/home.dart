import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:noteapp/models/weather_model.dart';
import 'package:noteapp/service/weather_api_client.dart';
import 'package:location/location.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {

// ici je creer une fonction d'appel a l'API
WeatherApiClient client = WeatherApiClient();
Weather? data;

Future<void> getData() async{
  data = await client.getCurrentWeather("dakar");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        elevation: 5,
      
         actions:[
        
         IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        
      
         ]
 
      ),
    
     body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return Container(
          margin: EdgeInsets.only(top:70),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: 500,
            margin: EdgeInsets.only(right: 5,left: 5,top: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color(0xff955cd1),
                  Color(0xff3fa2fa),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.15, 0.75],
                 ),
            ),
          
            child: Column(  
              children:[
                Text(
                  "${data!.cityName}",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontFamily: 'kabel',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'lundi, 12, Septembre',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    fontFamily: 'Raleway'
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/fonts/soleil.png',
                width: 100,
                height: 100,),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'ensoleillée',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                  ),
                ),

                 SizedBox(
                  height: 10,
                ),
                Text(
                  "${data!.temp}°",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hubbali'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset('assets/fonts/vent.png',
                          height: 50,
                          width: 50,
                          ),
                          Text(
                            "${data!.speed}km/h",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubbali',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'vent',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset('assets/fonts/humidite.png',
                          height: 50,
                          width: 50,
                          ),
                          Text(
                            "${data!.humidity}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubbali',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'humidité',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      )
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Image.asset('assets/fonts/vectoriel.png',
                          height: 50,
                          width: 50,
                          ),
                          Text(
                            'SE',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hubbali',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'direction vent',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      )
                    )
                
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'resenti',
                      style: TextStyle(color: Colors.white.withOpacity(0.5),
                      fontFamily: 'Raleway',
                      fontSize: 17 ),
                    ),
                    Text(
                      "${data!.feels_like}",
                      
                      style: TextStyle(color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 25 ),
                    ),
                    Text(
                      '°',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15 ),
                    ),

                   Container(
                    height: 5,
                    width: 5,
                    color: Colors.greenAccent,
                   )
                  ],
                )
              
              ),
              Expanded(
              
                child: Column(
                
                  children: [

                    Text(
                      'Visibilité',
                      style: TextStyle(color: Colors.white.withOpacity(0.5),
                      fontFamily: 'Raleway',
                      fontSize: 17 ),
                    ),
                    Text(
                      "${data!.visibilite}",
                      style: TextStyle(color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 25 ),
                    ),
                    Text(
                      'm',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15 ),
                    ),
                    Container(
                    height: 5,
                    width: 5,
                    color: Colors.redAccent,
                   )
                  ],
                )
              
              ),
              Expanded(
                child: Column(
                  children: [
                  
                    Text(
                      'pression',
                      style: TextStyle(color: Colors.white.withOpacity(0.5),
                      fontFamily: 'Raleway',
                      fontSize: 17 ),
                    ),
                    Text(
                      "${data!.pressure}",
                      style: TextStyle(color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 25 ),
                    ),
                    Text(
                      '%',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15 ),
                    ),
                    Container(
                    height: 5,
                    width: 5,
                    color: Colors.greenAccent,
                  
                   )
                  ],
                )
              
              ),

              
            ],
          )

        ],
      ),
      
      );
      }
      return Container();
      }
     )  
    );
  }
}
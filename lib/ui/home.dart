import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/ui/provider/weather_provider.dart';

import '../model/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Weather>? weatherFuture;
  final searchedCity = TextEditingController();


  @override
  void initState() {
    weatherFuture = Provider.of<WeatherProvider>(context,listen: false).getWeather(city: 'cairo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 22,),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          setState(() {
                            weatherFuture = Provider.of<WeatherProvider>(context,listen: false).getWeather(city: searchedCity.text);
                          });
                        },
                        icon: const Icon(
                            Icons.search
                        ),

                      ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        controller: searchedCity,
                        keyboardType:  TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'search',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
                FutureBuilder(
                  future: weatherFuture,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold

                                  ),
                                  '${snapshot.data!.location!.name}' ', ' ),
                          const SizedBox(height: 10,),

                          Text(
                                  style: const TextStyle(
                                      fontSize: 18
                                  ),
                                  '${snapshot.data!.location!.region}'),

                          const SizedBox(height: 10,),
                          Text(
                              style: const TextStyle(
                                  fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                              '${snapshot.data!.location!.country}' ),
                          const SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  const Text('o',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        style: const TextStyle(
                                            fontSize: 66,
                                            fontWeight: FontWeight.bold
                                        ),
                                        '${snapshot.data!.current!.temp_c!.toInt()}' ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40,),

                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage('https:${snapshot.data!.current!.condition!.icon}'),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                    height: 75,
                                    width: 75,
                                  ),
                                  Text(
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                      '${snapshot.data!.current!.condition!.text}' ),

                                ],
                              ),

                            ],
                          ),
                        ],
                      );
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

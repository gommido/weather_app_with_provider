
class Weather
{

  Current? current;
  Location? location;

  Weather({ this.current,this.location});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      current: Current.fromJson(json["current"]),
      location: Location.fromJson(json["location"]),

    );
  }
//

}



class Location
{

  String? name;
  String? region;
  String? country;

  Location({this.region, this.country,this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(

      name: json["name"],
      region: json["region"],
      country: json["country"],

    );
  }



}


class Current
{
  double? temp_c;
  Condition? condition;

  Current({this.temp_c,this.condition});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temp_c: json["temp_c"],
      condition: Condition.fromJson(json["condition"]) ,

    );
  }
//

}

class Condition
{
  String? text;
  String? icon;

  Condition({this.text,this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json["text"],
      icon: json["icon"],
    );
  }
//

}
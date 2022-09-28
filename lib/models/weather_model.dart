class Weather{
  String? cityName;
  double? temp;
  double? speed;
  int? humidity;
  double? feels_like;
  int? pressure;
  int? visibilite;
 
  

  Weather({
    this.cityName,
    this.temp,
    this.speed,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.visibilite,
    
    
    
  });
  // maintenant je vais creer une fonction pour convertir les fichier json dans le model

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    speed = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"].toDouble();
    pressure = json["main"]["pressure"];
    visibilite = json["visibility"];
    
    
  }
}

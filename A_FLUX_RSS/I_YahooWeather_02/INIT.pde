////////////////////////// SETUP INIT

void initialise() {
  // Web address
  String url = "http://weather.yahooapis.com/forecastrss?w=" + place + "&u=c";

  XML xml = loadXML(url);
  String s = xml.format(0); // formats XML :–)
  print(s);

  // Grab and store necessary data
  XML prevision = xml.getChild("channel/item/yweather:forecast");
  XML location = xml.getChild("channel/yweather:location");

  XML wind = xml.getChild("channel/yweather:wind");
  windSpeed = wind.getFloat("speed");

  city = location.getString("city");
  temperature = prevision.getInt("high");
  weather = prevision.getString("text");
}


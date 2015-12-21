////////////////////////// SETUP INIT

void initialise() {
  // Adresse WEB
  String url = "http://weather.yahooapis.com/forecastrss?w=" + place + "&u=c";

  // On charge l'adresse dans un objet XML 
  XML xml = loadXML(url);
  String s = xml.format(0); // formats XML :–)
  print(s);// Afficher le contenu brut en XML dans la console en bas.

  // On va récupérer chaque élément et les stocker
  XML prevision = xml.getChild("channel/item/yweather:forecast");
  XML location = xml.getChild("channel/yweather:location");

  XML wind = xml.getChild("channel/yweather:wind");
  vitesseVent = wind.getFloat("speed");

  // Ensuite on les attribue à nos variables city/temperature/meteo 
  city = location.getString("city");
  temperature = prevision.getInt("high");
  meteo = prevision.getString("text");
}


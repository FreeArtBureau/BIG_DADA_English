/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 YahooWeather_01
 --------------
 
 */
 
/////////////////////////// GLOBALS ////////////////////////////
// Variable pour stocker la température
int temperature = 0;
// Variable pour stocker la condition météo
String meteo = "";

/*
 On récupère les données météorologiques par ville ou par région et par un chiffre spécifique.
 Ce chiffre est déterminé par Yahoo et il s'appelle WOEID (Where On Earth Identifiers)
 575961 = WOEID pour Amiens
 7153326 = WOEID pour Picardie
 Voir l'onglet INFO_WOEID pour connaitre les autres chiffres pour les régions de la France
 */
String place = "575961"; // WOEID > Amiens
String city = "";

PFont font;
XML result;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 360);
  // La fonte pour notre texte
  font = createFont("Merriweather-Light.ttf", 28);
  textFont(font);

  // ADRESSE WEB POUR YAHOO WEATHER
    String url = "http://weather.yahooapis.com/forecastrss?w=" + place + "&u=c";

  // CHARGER LES DONNÉES
  XML xml = loadXML(url);
  String s = xml.format(0); // formats XML :–)
  print(s);// Afficher le contenu brut en XML dans la console en bas.
  
  // Voici une autre manière de récupérer des données directement
  // d'une balise avec la méthode getChild()
  XML forecast = xml.getChild("channel/item/yweather:forecast");
  XML location = xml.getChild("channel/yweather:location");
  // On peut ensuite extraire les données voulues et les attribuer à nos variables
  city = location.getString("city");
  temperature = forecast.getInt("high");
  meteo = forecast.getString("text");
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  fill(0);

  // Affichage des données
  text("City: " + city, width*0.15, height*0.33);
  text("Today’s high: " + temperature, width*0.15, height*0.5);
  text("Forecast: " + meteo, width*0.15, height*0.66);
 
}


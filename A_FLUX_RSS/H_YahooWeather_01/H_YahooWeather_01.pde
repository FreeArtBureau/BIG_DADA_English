/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ---------------
 YahooWeather_01
 ---------------
 
 Accesses YahooWeather RSS feeds
 
 */
 
/////////////////////////// GLOBALS ////////////////////////////
// Variable for storing temperature
int temperature = 0;
//  Variable for storing weather conditions
String weather = " ";

/*
 We can access weather data for towns and regions using a special 
 code called WOEID (Where On Earth Identifiers).
 Eg.
 575961 = WOEID for Amiens
 7153326 = WOEID for the region Picardie
 See tab INFO_WOEID to learn more.
 */
String place = "575961"; // WOEID > Amiens
String city = "";

PFont font;
XML result;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 360);
  font = createFont("Merriweather-Light.ttf", 28);
  textFont(font);

  // RSS Web address
  String url = "http://weather.yahooapis.com/forecastrss?w=" + place + "&u=c";

  // Load data
  XML xml = loadXML(url);
  String s = xml.format(0); // formats XML :–)
  print(s);// Raw data to console
  
  // Notice syntax for String addresses
  XML forecast = xml.getChild("channel/item/yweather:forecast");
  XML location = xml.getChild("channel/yweather:location");
  // Grab and store necessary data
  city = location.getString("city");
  temperature = forecast.getInt("high");
  weather = forecast.getString("text");
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  fill(0);

  // Display data
  text("City: " + city, width*0.15, height*0.33);
  text("Today’s high: " + temperature, width*0.15, height*0.5);
  text("Forecast: " + weather, width*0.15, height*0.66);
 
}


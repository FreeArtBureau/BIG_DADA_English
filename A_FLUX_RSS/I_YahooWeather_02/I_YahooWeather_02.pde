/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ---------------
 YahooWeather_02
 ---------------
 
 Accesses YahooWeather RSS feeds 
 
 */
/////////////////////////// GLOBALS ////////////////////////////

// Variable for storing temperature
int temperature = 0;
//  Variable for storing weather conditions
String weather = "";

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
float windSpeed;
// Wind animation variables
float noiseScale = 0.02;
float noiseAmm = 50.0;
float lineLnH = 10.0; // length of lines

PFont font;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 360);
  smooth();
  colorMode(HSB, 360, 100, 100);
  font = createFont("SourceSansPro-Semibold.ttf", 34);
  textFont(font);
  initialise(); // see INIT tab
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 100);

  // See GRAPHICS tab
  temperatureBG(); //
  displayText();// fonction pour afficher le texte
  lines(); // fonction pour dessiner une trame de lignes
}



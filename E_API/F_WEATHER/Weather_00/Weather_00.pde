/* ------------
 * Weather API
 * -----------
 *
 * Sketch : Weather_00
 * Grabs current weather conditions for a city
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * http://openweathermap.org
 *
 * MW_2017
 * links / refs ...
 * end
 */

/////////////////////////// GLOBALS ////////////////////////////

WeatherAPI myWeather;
PFont f;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(780, 400);
  background(0, 0, 33);
  smooth();
  noStroke();
  f = loadFont("FiraMono-Regular-48.vlw");
  textFont(f, 48);
  
  myWeather = new WeatherAPI("Manchester");
  myWeather.parseData();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 33);  
  myWeather.displayData(90, 100, 30);
  stroke(0,255, 255);
  strokeWeight(1.7);
  myWeather.windGraphic();
}

/////////////////////////// FUNCTIONS ////////////////////////////
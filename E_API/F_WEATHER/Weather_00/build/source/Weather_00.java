import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Weather_00 extends PApplet {

/* ------------
 * Weather API
 * -----------
 *
 * Sketch : Weather_00
 * Grabs current weather conditions for a city
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * // http://openweathermap.org
 *
 * MW_2017
 * links / refs ...
 * end
 */

/////////////////////////// GLOBALS ////////////////////////////

WeatherAPI myWeather;
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  
  background(0, 0, 33);
  
  noStroke();
  myWeather = new WeatherAPI();
}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
class WeatherAPI {

   JSONObject json;
   String myKey = " --- YOUR API KEY HERE --- ";
   String city = "Amiens";
   String units = "metric"; // or imperial
   String url = "api.openweathermap.org/data/2.5/weather?q="+city+"&"+units;
   String api = "http://"+url+"&APPID="+myKey;

   String condition;
   float temperature;
   float humidity;

   WeatherAPI(){
     json = loadJSONObject(api);
     println(json);

   }

   public void parseData(){
      JSONArray weather = json.getJSONArray("weather");
      JSONObject content =  weather.getJSONObject(0);
        condition = content.getString("description");

      JSONObject main =  json.getJSONObject("main");
        temperature =  main.getFloat("temp");
        humidity =  main.getFloat("humidity");
   }

 }
  public void settings() {  size(780, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Weather_00" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

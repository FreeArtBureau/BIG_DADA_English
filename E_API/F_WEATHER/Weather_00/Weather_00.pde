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

void setup() {
  size(780, 400);
  background(0, 0, 33);
  smooth();
  noStroke();
  myWeather = new WeatherAPI();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
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

   void parseData(){
      JSONArray weather = json.getJSONArray("weather");
      JSONObject content =  weather.getJSONObject(0);
        condition = content.getString("description");

      JSONObject main =  json.getJSONObject("main");
        temperature =  main.getFloat("temp");
        humidity =  main.getFloat("humidity");
   }

 }

/**
 * A custom class for connecting to the openweather API
 * http://openweathermap.org
 */
 
 class WeatherAPI {

  JSONObject json;
  String myKey = " --- YOUR API KEY HERE --- ";
  String city;
  String units = "metric"; // or imperial
  String url;
  String api;

  String condition;
  float temperature;
  float humidity;
  float degrees;
  float speed;

  WeatherAPI(String _s) {
    this.city = _s;
    this.url = "api.openweathermap.org/data/2.5/weather?q="+city+"&"+units;
    this.api = "http://"+url+"&APPID="+myKey;
    try{
        json = loadJSONObject(api);
      }catch (Exception e){
        println("Hmmm, something went wrong");
    }
    println(json);
  }

  void parseData() {
    JSONArray weather = json.getJSONArray("weather");
    JSONObject content =  weather.getJSONObject(0);
    condition = content.getString("description");

    JSONObject main =  json.getJSONObject("main");
    temperature =  main.getFloat("temp");
    humidity =  main.getFloat("humidity");

    JSONObject wind =  json.getJSONObject("wind");
    degrees =  wind.getFloat("deg");
    speed =  wind.getFloat("speed");
  }

  void displayData(float _x, float _y, int _fontSize) { 
    pushMatrix();
    translate(_x, _y);
    textSize(_fontSize);
    int yOff = _fontSize;

    text("City: " + city, 0, 0);
    text("Condition: " + condition, 0, yOff);
    text("Temp: " + temperature, 0, yOff*2);
    text("Humidity: " + humidity, 0, yOff*3);
    text("Wind direction: " + degrees, 0, yOff*4);
    text("Wind speed: " + speed, 0, yOff*5);
    popMatrix();
  }

   
  void windGraphic() {
    // Wind animation variables
    float noiseScale = 0.02;
    float noiseAmm = 50.0;
    float lineLnH = 10.0; // length of lines

    for (int yPos=75; yPos<height-75; yPos+=25) {
      for (int xPos=75; xPos<width-75; xPos+=25) {
        float ws =  map(speed, 0, 120, 0, 0.5);
        float z = frameCount*ws;
        float offSet = noise(xPos*noiseScale, yPos*noiseScale, z) * noiseAmm;
        pushMatrix();
        translate(xPos, yPos);
        //noFill();
        rotate(radians(degrees));
        line(-lineLnH+offSet, -lineLnH, lineLnH, lineLnH);
        popMatrix();
      }
    }
  }
}
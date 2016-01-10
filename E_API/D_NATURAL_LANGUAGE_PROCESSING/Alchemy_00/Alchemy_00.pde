/*
 * ---------------------------
 * Natural Language Processing
 * ---------------------------
 *
 * Alchemy_00
 * Basic api connection to retrieve keywords from an online article
 *
 * MW_12.2015
 * http://www.alchemyapi.com/
 * REF : http://www.alchemyapi.com/api/keyword/urls.html
 *
 * end

*/

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;

String text = " ";
String myKey = "   "; // ADD YOUR APIKEY HERE
String url = "http://www.theguardian.com/uk-news/2015/dec/25/queen-christmas-message-light-darkness-tv-broadcast";
String api = "http://gateway-a.watsonplatform.net/calls/url/URLGetRankedKeywords?apikey="+myKey+
"&outputMode=json&url="+url+"&sentiment=1";
/////////////////////////// SETUP ////////////////////////////

void setup() {
  //size(400, 400);
  background(0);
  smooth();
  noStroke();
  
  json = loadJSONObject(api);
  print(json); // print raw data to console for debugging



}

/////////////////////////// DRAW ////////////////////////////
void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////

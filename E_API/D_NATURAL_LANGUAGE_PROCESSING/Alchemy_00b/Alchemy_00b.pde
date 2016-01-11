/*
 * ---------------------------
 * Natural Language Processing
 * ---------------------------
 *
 * Alchemy_00b
 * Basic api connection to retrieve keywords from an online article
 * - Grabs & displays in the console most relevant keywords for the article
 *
 * MW_12.2015
 * http://www.alchemyapi.com/
 * REF : http://www.alchemyapi.com/api/keyword/urls.html
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;

String myKey = "  "; // ADD API KEY HERE
String url = "http://www.theguardian.com/uk-news/2015/dec/25/queen-christmas-message-light-darkness-tv-broadcast";
String api = "http://gateway-a.watsonplatform.net/calls/url/URLGetRankedKeywords?apikey="+myKey+
"&outputMode=json&url="+url+"&sentiment=1";

String[] articleKeywords;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(780, 680);
  background(0, 0, 33);
  smooth();
  noStroke();
  grabAPIData(api);

  //Display main concepts
  fill(100, 230, 255);
  textSize(18);
  float yPos = 30;
  float xPos = 40;

  for (int i=0; i<articleKeywords.length; i++) {
    text(articleKeywords[i], xPos, yPos);
    yPos+=22;
    if (yPos > height-80) {
      yPos = 30;
      xPos = 360;
    }
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////

void grabAPIData(String s) {
  json = loadJSONObject(s);
  print(json); // print raw data to console for debugging  

  JSONArray keyWords = json.getJSONArray("keywords");

  articleKeywords = new String[keyWords.size()];
  for (int i=0; i<keyWords.size (); i++) {
    JSONObject content = keyWords.getJSONObject(i);
    String text = content.getString("text");
    println(text);
    articleKeywords[i] = text;
  }
}


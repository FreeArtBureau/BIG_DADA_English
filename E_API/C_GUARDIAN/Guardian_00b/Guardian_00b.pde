/* -----------------------------
 * Guardian Word Search Articles
 * -----------------------------
 *
 * Sketch : Guardian_00b
 * Grabs latest articles based on a tag
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * http://open-platform.theguardian.com/
 *
 * MW_2015
 * links / refs ...
 * 
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;

String tag = "technology";
String myKey = "  "; // ADD YOUR API KEY HERE
String url = "http://content.guardianapis.com/tags?q="+tag+"&api-key="+myKey;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  //size(780, 400);
  background(0, 0, 33);
  smooth();
  noStroke();
  // grab data from url
  grabAPIData(url);
  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Function for loading data and grabbing articles
void grabAPIData(String s) {
  // load data from API
  json = loadJSONObject(s);
  print(json); // print raw data to console for debugging

}
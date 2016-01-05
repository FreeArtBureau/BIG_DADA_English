/*
 * Wordnik_Word_Frequency
 * Grabs frequency data for a word from Wordnik API
 *
 * MW_2015
 * REF :
 * http://developer.wordnik.com
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;
String word = "beautiful"; // search word
String url = "http://api.wordnik.com/v4/word.json/"+word+"/frequency?useCanonical=false&startYear=1800&endYear=2012&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5";

int[] word_freqs; // array for saving data
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 400);
  background(0);
  smooth();
  noStroke();
  // function that loads data from url
  grabAPIData(url);

  // PLOT DATA
  for (int i=0; i<word_freqs.length; i++) {
    stroke(0, 0, 255);
    int xPos = (i*width)/word_freqs.length;
    line(xPos, height-20, xPos, height-20-word_freqs[i]);
  }
  fill(255);
  textSize(18);
  text(word, 20, 30);

  textSize(12);
  text("1800", 3, height-5);
  text("2012", width-35, height-5);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////

void grabAPIData(String s) {
  
  // load data from API
  json = loadJSONObject(s);
  print(json); // print raw data to console

  // Grab all data for "frequency" and put in an array
  JSONArray dataJSON = json.getJSONArray("frequency");
  word_freqs = new int[dataJSON.size()];

  // read array
  for (int i=0; i<dataJSON.size (); i++) {
    // Get array content
    JSONObject content =  dataJSON.getJSONObject(i);
    int count = content.getInt("count");
    int year = content.getInt("year");
    //println("Year: "+year+" Count: "+count);
    word_freqs[i] = count;
  }
}


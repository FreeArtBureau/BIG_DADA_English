/*
 * Wordnik_Word_Random
 * Grabs random words from Wordnik API
 *
 * MW_2015
 * REF :
 * http://developer.wordnik.com
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONArray json;
String partOfSpeech = "noun"; // include only these parts of speech (noun/verb/adverb/pronoun/article/...see doc : http://developer.wordnik.com/docs.html#!/words/getRandomWords_get_3
String url = "http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&includePartOfSpeech="+partOfSpeech+"&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5";
// Use this url if you want to grab all types of random words
String url2 ="http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5";
String[] words; // array for saving data
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(300, 400);
  background(0);
  smooth();
  noStroke();
  // function that loads data from url
  grabAPIData(url);
  
  // Display words
  fill(255, 255, 0);
  textSize(18);
  int yPos =40;
  for (int i=0; i<words.length; i++) {
    text(words[i], 10, yPos);
    yPos+=22;
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////

void mousePressed() {
  setup();
}


void grabAPIData(String s) {
  // load data from API
  json = loadJSONArray(s);
  //print(json); // print raw data to console
  words = new String[json.size()];

  // read array
  for (int i=0; i<json.size (); i++) {
    // Get array content
    JSONObject content =  json.getJSONObject(i);
    String w = content.getString("word");
    words[i] = w;
  }
}


/*
 * ---------------------------
 * Natural Language Processing
 * ---------------------------
 *
 * Alchemy_00c
 * Basic api connection to retrieve keywords from an online article
 * - Grabs & displays in the console most relevant keywords for the article
 * - Grabs & displays in the console keyword relevancy
 * - Grabs & displays in the console sentiment analysis score and type
 * - Visualise on a linear colour graph sentiment score
 *
 * MW_01.2016
 * http://www.alchemyapi.com/
 * REF : http://www.alchemyapi.com/api/keyword/urls.html
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;

String myKey = "  "; // ADD API KEY HERE
String url = "http://www.theguardian.com/technology/2016/jan/11/david-bowie-bowienet-isp-internet";
String api = "http://gateway-a.watsonplatform.net/calls/url/URLGetRankedKeywords?apikey="+myKey+
"&outputMode=json&url="+url+"&sentiment=1";

int negativeCount;
int positiveCount;
float[] sentimentScore;
float[] keyWordRelevance;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(780, 250);
  background(0, 0, 33);
  smooth();
  noStroke();
  grabAPIData(api);
  println("Total positive : "+positiveCount);
  println("Total negative : "+negativeCount);

  //Display sentiment score on a linear graphic scale   
  for (int i=0; i<sentimentScore.length; i++) {

    float sentimentRange = map(sentimentScore[i], -1, 1, 0, width);
    float dia = map(keyWordRelevance[i], 0, 1, 5, 35);
    noStroke();
    if (sentimentScore[i]<=0) {
      int c = (int)map(sentimentScore[i], -1, 0, 255, 0);
      fill(c, 0, 0);
    } else if (sentimentScore[i]>=0) {
      int c = (int)map(sentimentScore[i], 0, 1, 0, 255);
      fill(0, c, 0);
    }
    ellipse(sentimentRange, height/2, dia, dia);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////

void grabAPIData(String s) {
  json = loadJSONObject(s);
  //print(json); // print raw data to console for debugging  

  JSONArray keyWords = json.getJSONArray("keywords");
  sentimentScore = new float[keyWords.size()];
  keyWordRelevance = new float[keyWords.size()];

  for (int i=0; i<keyWords.size (); i++) {
    JSONObject content = keyWords.getJSONObject(i);
    String text = content.getString("text");
    println(text);
    float relevance = content.getFloat("relevance");
    println("keyword relevance is "+relevance);
    keyWordRelevance[i] = relevance;
    // Get Sentiment type
    JSONObject sentiment = content.getJSONObject("sentiment");

    // Some data does not containt a "score" value so we need to use try{} exception
    try {
      float score = sentiment.getFloat("score");
      println("Sentiment score = "+score);
      sentimentScore[i] = score;
    }  // Check for errors
    catch (Exception ex) { 
      System.out.println("No score found for this data");
    }

    String st = sentiment.getString("type");
    countSentiments(st);

    println("Sentiment analysis : "+st);
    println("////////////////////////////////////////");
  }
}

void countSentiments(String s) {
  if (s.equals("positive")) {
    positiveCount++;
  }
  if (s.equals("negative")) {
    negativeCount++;
  }
}


/* ----------------------------
 * Guardian Word Search Articles
 * ----------------------------
 *
 * Sketch : Guardian_02
 *
 * - Grabs latest articles based on search word
 * - Displays results (article titles) to window & grabs a web address
 * - Also grabs full article content & parses html for clean text ;–)
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * http://open-platform.theguardian.com/
 *
 * MW_2015
 * links / refs ...
 * Uses Jsoup to parse HTML : http://jsoup.org/
 * 
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
JSONObject json;
JSONArray dataJSON;
String SearchTag = "Christmas";
String myKey = "  "; // ADD YOUR API KEY HERE
String url = "http://content.guardianapis.com/search?show-fields=body&q="+SearchTag+"&page-size=16&api-key="+myKey;

String[] articleTitles; // array for saving data
String articlesText; // saved body text (article content)
float yPos;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(780, 400);
  background(0, 0, 33);
  smooth();
  noStroke();
  // grab data from url
  grabAPIData(url);

  // Display data
  fill(100, 230, 255);
  textSize(18);
  yPos = 30;
  for (int i=0; i<articleTitles.length; i++) {
    text(articleTitles[i], 40, yPos);
    yPos+=22;
  }

  // Grab & store a web address
  // Later will be used to grab content and do peraps some language analysis
  String webLink = grabArticleWebLink(1);
  //text("A web link "+webLink, 30, height-50);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Function for loading data and grabbing articles
void grabAPIData(String s) {
  // load data from API
  json = loadJSONObject(s);
  //print(json); // print raw data to console for debugging

  // Grab all data for "results" and put in an array
  JSONObject response =  json.getJSONObject("response");
  dataJSON = response.getJSONArray("results");
  articleTitles = new String[dataJSON.size()];

  // read array & assign to data array
  for (int i=0; i<dataJSON.size (); i++) {
    
    // Get array content
    JSONObject content =  dataJSON.getJSONObject(i);
    String title = content.getString("webTitle");
    // Add content to our article title's array
    articleTitles[i] = title;  

    // Now get text from body field
    JSONObject f = content.getJSONObject("fields");
    String body = f.getString("body");
    //println(body);

    // parse text using Jsoup ;–)
    Document doc = Jsoup.parse(body);
    articlesText = doc.text();
    println(articlesText);

  }
}


// Function for getting a web address for any of the articles by index.
String grabArticleWebLink(int _index) {
  
  // Get only indexed web link
  JSONObject webUrl = dataJSON.getJSONObject(_index);
  String articleUrl = webUrl.getString("webUrl");
  //println(articleUrl); 
  return articleUrl;
}

